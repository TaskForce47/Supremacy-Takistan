_aoPos = _this select 0;
if(isNil "samMarkers") then {
	samMarkers = ["sam","sam_1","sam_2","sam_3"];
};

samTaskMsg = ["A hostile SAM Site consisting of SA-3s, SA-15s, SA-19s and SA-20s has been spotted near the Main Target. Destroy it!","Priority Mission: SAM Site","Priority Mission"];

_samInitText = format
	[
		"<t align='center' size='1.5'>New Priority Mission available!</t><br/><t size='1' align='center' color='#994044'>%1</t>",
		"A hostile SAM Site consisting of SA-3s, SA-15s, SA-19s and SA-20s has been spotted near the Main Target. Destroy it!"
	];

samEndText = format
	[
		"<t align='center' size='1.5'>Priority Mission Completed!</t><br/><t size='1' align='center' color='#0040FF'>%1</t><br/>____________________<br/>Congratulations!<br/><br/> Outstanding work, Soldiers!",
		"Those SAMs won't shoot down any aircrafts anymore!"
	];

_dist = [[]];

// BEST Algorithm ever 
for "_i" from 0 to ((count samMarkers) -1) do {
	_curMarker = (samMarkers select _i);
	_dist pushBack ((getMarkerPos _curMarker) distance _aoPos);
};
_dist sort true;

_closestPos = _dist select 0;
_closestMarker = 0;

for "_i" from 0 to ((count samMarkers) -1) do {
	if(((getMarkerPos (samMarkers select _i)) distance _aoPos) == _closestPos) then {
		_closestMarker = (samMarkers select _i);
	};
};

for "_i" from 0 to ((count samMarkers) -1) do {
	if(_closestMarker == (samMarkers select _i)) then {
		samMarkers deleteAt _i;
	};
};

_sitePos = getMarkerPos _closestMarker;

sleep 5;

_allObjectsArr = [];
_nextPos = [];

_allObjectsArr = _allObjectsArr + ([_sitePos] call TF47_SamBuilding_fnc_buildSA20);
sleep 5;

// Supply
_nextPos = [_sitePos, 50, 160, 400] call TF47_SamBuilding_fnc_findSamPosition;
if(((count _nextPos) != 0)) then {
	_allObjectsArr = _allObjectsArr + ([_nextPos] call TF47_SamBuilding_fnc_buildSupply);
};
sleep 5;

// P-12 Radar
_nextPos = [_sitePos, 50, 175, 400] call TF47_SamBuilding_fnc_findSamPosition;
if(((count _nextPos) != 0)) then {
	_allObjectsArr = _allObjectsArr + ([_nextPos,"pook_P12_RU"] call TF47_SamBuilding_fnc_buildSingleSam);
};
sleep 5;

// SA-3 (mobile)
_nextPos = [_sitePos, 50, 250, 500] call TF47_SamBuilding_fnc_findSamPosition;
if(((count _nextPos) != 0)) then {
	_allObjectsArr = _allObjectsArr + ([_nextPos,"pook_sa3_tracked_tak"] call TF47_SamBuilding_fnc_buildSingleSam);
};
sleep 5;

_nextPos = [_sitePos, 50, 250, 500] call TF47_SamBuilding_fnc_findSamPosition;
if(((count _nextPos) != 0)) then {
	_allObjectsArr = _allObjectsArr + ([_nextPos,"pook_sa3_tracked_tak"] call TF47_SamBuilding_fnc_buildSingleSam);
};
sleep 5;

// SA-15 
_nextPos = [_sitePos, 50, 250, 500] call TF47_SamBuilding_fnc_findSamPosition;
if(((count _nextPos) != 0)) then {
	_allObjectsArr = _allObjectsArr + ([_nextPos,"pook_9k332_tak"] call TF47_SamBuilding_fnc_buildSingleSam);
};
sleep 5;

_nextPos = [_sitePos, 50, 250, 500] call TF47_SamBuilding_fnc_findSamPosition;
if(((count _nextPos) != 0)) then {
	_allObjectsArr = _allObjectsArr + ([_nextPos,"pook_9k332_tak"] call TF47_SamBuilding_fnc_buildSingleSam);
};
sleep 5;

// 2x SA-19 patrol
for "_i" from 0 to 1 do {
	_nextPos = _sitePos findEmptyPosition [50, 500];
	_newVehicle = "pook_sa19_tak" createVehicle _nextPos;
	_newGroup = createGroup east;
	_newVehicle setskill 1;
	createVehicleCrew _newVehicle;
	_allObjectsArr pushBack _newVehicle;
	(crew _newVehicle) join _newGroup;
	[_newGroup,_sitePos, 150] call BIS_fnc_taskPatrol;
	sleep 10;
};

// 1x BTR-60 patrol

_nextPos = _sitePos findEmptyPosition [50, 500];
_newVehicle = "cup_o_btr60_tk" createVehicle _nextPos;
_newGroup = createGroup east;
_newVehicle setskill 1;
createVehicleCrew _newVehicle;
_allObjectsArr pushBack _newVehicle;
(crew _newVehicle) join _newGroup;
[_newGroup,_sitePos, 100] call BIS_fnc_taskPatrol;
sleep 10;

// 1x Squad
_newGroup = [_nextPos,east, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK" >> "Infantry" >> "CUP_O_TK_InfantrySquad")] call BIS_fnc_spawnGroup;
[_newGroup,_sitePos, 100] call BIS_fnc_taskPatrol;
_allObjectsArr pushBack _newGroup;
sleep 10;

// 1x HQ
_newGroup = [_nextPos,east, ["CUP_O_TK_Commander","CUP_O_TK_Officer","CUP_O_TK_Soldier","CUP_O_TK_Soldier"]] call BIS_fnc_spawnGroup;
[_newGroup,_sitePos, 50] call BIS_fnc_taskPatrol;
_allObjectsArr pushBack _newGroup;

// Show global target start hint
["tskSam", true, samTaskMsg,_sitePos, "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;
[_samInitText] remoteExec ["SEPP_fnc_globalHint",0,false];

sleep 0.1;
// Sound for Hint for active Main Mission 
["Sidemission_new"] remoteExec ["SEPP_fnc_globalsound",0,false];

// get the vehicles
_refuel = [];
_reammo = [];

_allVehicles = [];
_allGroups = [];
// manage the site
{
	if((typeName _x) == "GROUP") then {
		_allGroups pushBack _x;
	} else {
		switch (typeOf _x) do {
			case "cup_o_ural_refuel_tka" : {
				_refuel = _x;
			};
			case "cup_o_ural_reammo_tka" : {
				_reammo = _x;
			};
		};
		if(_x isKindOf "Land" || ((typeOf _x) == "pook_P12_RU") || ((typeOf _x) == "pook_sa3_tracked_tak")) then {
			_allVehicles pushBack _x;
		};
	};
} forEach _allObjectsArr;

{
	_x addEventHandler ["Fired",{ _veh = (_this select 0); if((getDammage _reammo) > 0.95) then {_veh setVehicleAmmo 1;};}];
} forEach _allVehicles;


samSitePos = _sitePos;
allObjectsAtSamSite = _allObjectsArr;

cleanUpSam = compile "
{
	if((typeName _x) != 'GROUP') then {
		deleteVehicle _x;
	} else {
		{
			deleteVehicle _x;
		} forEach (units _x);
	};
} forEach allObjectsAtSamSite;
{
	if ((_x distance samSitePos) <= 500) then {
		deleteVehicle _x;
	};
} forEach allDead;
";

// trigger for complete mission
_samTrigger = createTrigger 		["EmptyDetector",_sitePos];   
_samTrigger setTriggerArea 		    [400, 400, 0, false];  
_samTrigger setTriggerActivation    ["EAST", "NOT PRESENT", false];   
_samTrigger setTriggerStatements    ["this", 
                                    "[samEndText] remoteExec ['SEPP_fnc_globalHint',0,false];
									['Sidemission_complete'] remoteExec ['SEPP_fnc_globalsound',0,false]; 
									['tskSam', true, samTaskMsg,samSitePos, 'SUCCEEDED', 1, true, true,'',true] call BIS_fnc_setTask;
									['tf47_changetickets', [WEST, 2, 15]] call CBA_fnc_globalEvent;
									[] call cleanUpSam;
                                    deletevehicle thisTrigger" , ""];
