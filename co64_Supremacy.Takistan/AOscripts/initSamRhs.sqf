_aoPos = _this select 0;
if(isNil "samMarkers") then {
	samMarkers = ["sam","sam_1","sam_2","sam_3"];
};

samTaskMsg = ["A hostile SAM Site has been spotted near the Main Target. Destroy it!","Priority Mission: SAM Site","Priority Mission"];

_samInitText = format
	[
		"<t align='center' size='1.5'>New Priority Mission available!</t><br/><t size='1' align='center' color='#994044'>%1</t>",
		"A hostile SAM Site has been spotted near the Main Target. Destroy it!"
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

// 4x ZSU
for "_i" from 0 to 4 do {
	_newGroup = [_sitePos, east, ["rhsgref_ins_g_zsu234"]] call BIS_fnc_spawnGroup;
	[_newGroup,_sitePos, 100] call BIS_fnc_taskPatrol;
	_allObjectsArr pushBack _newGroup;
	sleep 10;
};

sleep 10;

// 4x AA Patrol
for "_i" from 0 to 4 do {
	_newGroup = [_sitePos, east, (configfile >> "CfgGroups" >> "Indep" >> "rhsgref_faction_chdkz_g" >> "rhsgref_group_chdkz_ins_gurgents_infantry" >> "rhsgref_group_chdkz_ins_gurgents_squad")] call BIS_fnc_spawnGroup;
	[_newGroup,_sitePos, 100] call BIS_fnc_taskPatrol;
	_allObjectsArr pushBack _newGroup;
	sleep 5;
};

// Show global target start hint
["tskSam", true, samTaskMsg,_sitePos, "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;
[_samInitText] remoteExec ["SEPP_fnc_globalHint",0,false];
// Sound for Hint for active Main Mission
sleep 0.1;

["Sidemission_new"] remoteExec ["SEPP_fnc_globalsound",0,false];

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
