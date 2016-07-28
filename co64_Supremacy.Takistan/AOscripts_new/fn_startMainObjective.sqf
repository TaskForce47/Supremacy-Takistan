////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																																  //
//                      		***		ARMA3 Domination-Like-Script v1.0 - by Sepp	***											  //
//																																  //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(!([] call TF47_Helper_fnc_checkForHc)) exitwith {};

#include "AO_cfg.sqf"

private ["_Playertext", "_NumOfPlayers", "_AONumber", "_ao_mkr", "_radiotower","_missionComplete_trig", "_trig_rt", "_log_pos", "_ao_task", "_mkr_text", "_ao_name", "_ao_rad", "_position","_flatPos", "_ao_iniText", "_mission_complete", "_mission_new","_ao_ai_skill_array","_ao_pilot_skill_array"];

_AONumber = param [0, 0];

_ao_ai_skill_array  = [0.3,0.5,0.3,0.7,0.5,1,0.8,0.5,0.5,0.5]; // [aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed];
_ao_pilot_skill_array = [0.4,0.5,0.5,0.5,0.5,1,1,1,1,0.5];

if ((tf47_supremacy_main_var_missionState select _AONumber) == TF47_MISSION_STATE_ACTIVE) exitWith{
	diag_log format["fn_startMainObjective: Mission already active, exit"];
};

if (tf47_supremacy_main_var_missionCreationOngoing select _AONumber) exitWith{
	diag_log format["fn_startMainObjective: Mission creation in ongoing, exit"];
};

tf47_supremacy_main_var_missionState set [_AONumber,TF47_MISSION_STATE_ACTIVE];
tf47_supremacy_main_var_missionCreationOngoing set [_AONumber,true];

_log_pos = (tf47_supremacy_main_var_AOCollection select _AONumber) select TF47_SUPREMACY_MAIN_AOCOLLECTION_SELECT_LOGISTICMODULE;
_ao_name = (tf47_supremacy_main_var_AOCollection select _AONumber) select TF47_SUPREMACY_MAIN_AOCOLLECTION_SELECT_FULLNAME;
_ao_rad  = (tf47_supremacy_main_var_AOCollection select _AONumber) select TF47_SUPREMACY_MAIN_AOCOLLECTION_SELECT_RADIUS;


_mainObjectiveTaskHandle = format ["tf47_supremacy_main_taskHandle_%1",_AONumber];

 tf47_supremacy_main_var_Tasks set [_AONumber, _mainObjectiveTaskHandle];


_taksName = format ["Seize %1",_ao_name];
[_mainObjectiveTaskHandle, true, ["Seize the Village held by hostile forces",_taksName],_log_pos, "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;

//create ao marker to the ao 
_mainObjectiveMarker = createMarker [format ["tf47_supremacy_main_MainAreaMarker_%1",_AONumber], getpos _log_pos];
_mainObjectiveMarker setMarkerShape "ELLIPSE";
_mainObjectiveMarker setMarkerSize [_ao_rad, _ao_rad];
_mainObjectiveMarker setMarkerColor "ColorRed";


(tf47_supremacy_main_var_Marker select _AONumber) pushBack _mainObjectiveMarker;

// Hint for active Main Mission

_ao_iniText = format
[
	"<t align='center' size='1.5'>New Target</t><br/><t size='1' align='center' color='#FF0000'>%1</t><br/>____________________<br/>New Mission available near %1 !<br/><br/>Destroy the enemy's Radio Tower to stop them from calling in Reinforcements. <br/><br/> Also watch out for Enemy Bunker, check your Map to see their exact Location.",
	_ao_name
];

//Show global target start hint and play sound
[_ao_iniText] remoteExec ["SEPP_fnc_globalHint",0,false];
sleep 0.1;
["mission_new"] remoteExec ["SEPP_fnc_globalsound",0,false];


//////////////// Spawn Enemy AI in AO ///////////////////////////////////////////////////////////////////////////////////

// 350 


nul = [_log_pos,2,true,2,[6,6],_ao_rad,_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\fillHouse.sqf";


//****patrolls
//Infantry
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],false,0.1,[2,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
//Vehilces
nul = [_log_pos,2,_ao_rad,[true,false],[false,false,true],false,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
//air
nul = [_log_pos,2,_ao_rad,[true,false],[false,false,true],false,[0,0],[1,1],_ao_pilot_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";


/*
//####patrolls
//Infantry
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],false,[0,1,20],[2,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
//Vehilces
nul = [_log_pos,2,_ao_rad,[true,false],[false,false,true],false,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
//air
nul = [_log_pos,2,_ao_rad,[true,false],[false,false,true],false,[0,0],[1,1],_ao_pilot_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
*/


nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[7,2],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";

/*
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,1],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,1],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
*/

nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,1],_ao_pilot_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";

[getPos _log_pos, 200, 1000, round (1 + random 3), 1,_AONumber] call tf47_fnc_sniperTeam;
	
	
nul= [_log_pos] spawn tf47_fnc_static;

//////////////// create a radiotower /////////////////////////////////////////////////////////////////////////////////////////////
_r = random 150;
_phi = random 360;
_flatPos = [((getPos _log_pos) select 0) + _r*sin(_phi),((getPos _log_pos) select 1) + _r*cos(_phi)];
while {[_flatPos, 10, 1.5] call tf47_fnc_checkPos == 0} do
{
	_r = random 150;
	_phi = random 360;
	_flatPos = [((getPos _log_pos) select 0) + _r*sin(_phi),((getPos _log_pos) select 1) + _r*cos(_phi)];
};


if (tf47_param_vehiclemod == 1) then
{
	//Fill list of radio towers 
	tf47_supremacy_main_var_radiotowers set [_AONumber,  "Land_Ind_IlluminantTower" createVehicle _flatPos];  // A3 Tower: "Land_TTowerBig_2_F"
}
else
{
	//Fill list of radio towers 
	tf47_supremacy_main_var_radiotowers set [_AONumber,  "Land_TTowerBig_2_F" createVehicle _flatPos];
};





waitUntil { sleep 0.5; alive (tf47_supremacy_main_var_radiotowers select _AONumber) };
(tf47_supremacy_main_var_radiotowers select _AONumber) setVectorUp [0,0,1];

(tf47_supremacy_main_var_AOObjects select _AONumber) pushBack (tf47_supremacy_main_var_radiotowers select _AONumber);

//////////////// create 2 ai patrol around radiotower /////////////////////////////////////////////////////////////////////////

sleep 0.1;
nul = [(tf47_supremacy_main_var_radiotowers select _AONumber),2,20,[true,false],[false,false,false],false,[2,0],[0,0],"default",nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";	



		
//////////////// Hint for completed Main Mission /////////////////////////////////////////////////////////////////////////////////////////// 

ao_endText = format
	[
		"<t align='center' size='1.5'>Mission Completed!</t><br/><t size='1' align='center' color='#01DF01'>%1</t><br/>____________________<br/>Congratulations, you've managed to Seize %1!<br/><br/> Outstanding work, Soldiers!",
		_ao_name
	];


/*
// will be seperated.
switch (tf47_param_vehiclemod) do { 
	case 0 : {
		[_log_pos] execVM "AOscripts\initSAMVan.sqf";
	};
	case 1 : {
		[_log_pos] execVM "AOscripts\initSAM.sqf";
	};
	case 2 : {
		[_log_pos] execVM "AOscripts\initSAMRhs.sqf";
	};
};
*/
		
// create a helipad: part of reinforcements////////////////////////////////////////////////////////////////////////////////////////

	_poshelipad = [[[getPos _log_pos, _ao_rad]],["water","out"]] call BIS_fnc_randomPos;
	_flatPoshelipad = _poshelipad isFlatEmpty[15, 1, 0.3, 30, 0, false];
	
	while {(count _flatPoshelipad) < 1} do {
		_poshelipad = [[[getPos _log_pos, _ao_rad]],["water","out"]] call BIS_fnc_randomPos;
		_flatPoshelipad = _poshelipad isFlatEmpty[15, 1, 0.3, 30, 0, false];
	};

	_helipad = "Land_HelipadEmpty_F" createVehicle _flatPoshelipad;
	tf47_supremacy_main_var_HeliPad set[ _AONumber, _helipad]; 
	waitUntil { sleep 0.5; alive _helipad };
	(tf47_supremacy_main_var_AOObjects select _AONumber) pushBack helipad;


//////////////// Add Capturable Bunker /////////////////////////////////////////////////////////////////////////////////////////// 

		_r = 40 + random 150;
		_phi = 0;
		_flatBunkerpos = [((getPos _log_pos) select 0) + _r*sin(_phi),((getPos _log_pos) select 1) + _r*cos(_phi)];
		while {[_flatBunkerpos, 5, 3] call tf47_fnc_checkPos == 0} do
		{
			_rx = 40 + random 150;
			_phi = _phi + random 0.5;
			_flatBunkerpos = [((getPos _log_pos) select 0) + _rx*sin(_phi),((getPos _log_pos) select 1) + _rx*cos(_phi)];
		};

		_captureBunker1 = [_flatBunkerpos,5,"Land_fortified_nest_big_EP1", 30, east,format["captureBunker1_%1",_AONumber],_AONumber] call tf47_dyncap_fnc_createCaptureLocation;
		(tf47_supremacy_main_var_Bunker select _AONumber) pushBack _captureBunker1;
		(tf47_supremacy_main_var_AOObjects select _AONumber) pushBack _captureBunker1;
	

		sleep 1;

		_r = random 200;
		_phi = _phi + 90;
		_flatBunkerpos = [((getPos _log_pos) select 0) + _r*sin(_phi),((getPos _log_pos) select 1) + _r*cos(_phi)];
		while {[_flatBunkerpos, 5, 3] call tf47_fnc_checkPos == 0} do
		{
			_rx = _r + random 100;
			_phi = _phi + random 0.5;
			_flatBunkerpos = [((getPos _log_pos) select 0) + _rx*sin(_phi),((getPos _log_pos) select 1) + _rx*cos(_phi)];
		};

		_captureBunker2 = [_flatBunkerpos,5,"Land_fortified_nest_big_EP1", 30, east,format["captureBunker2_%1",_AONumber],_AONumber] call tf47_dyncap_fnc_createCaptureLocation;
		(tf47_supremacy_main_var_Bunker select _AONumber) pushBack _captureBunker2;
		(tf47_supremacy_main_var_AOObjects select _AONumber) pushBack _captureBunker2;

		sleep 1;

		_r = random 200;
		_phi = _phi + 90;
		_flatBunkerpos = [((getPos _log_pos) select 0) + _r*sin(_phi),((getPos _log_pos) select 1) + _r*cos(_phi)];
		while {[_flatBunkerpos, 5, 3] call tf47_fnc_checkPos == 0} do
		{
			_r = random 300;
			_phi = _phi + random 0.5;
			_flatBunkerpos = [((getPos _log_pos) select 0) + _r*sin(_phi),((getPos _log_pos) select 1) + _r*cos(_phi)];
		};

		_captureBunker3 = [_flatBunkerpos,5,"Land_fortified_nest_big_EP1", 30, east,format["captureBunker3_%1",_AONumber],_AONumber] call tf47_dyncap_fnc_createCaptureLocation;
		(tf47_supremacy_main_var_Bunker select _AONumber) pushBack _captureBunker3;

		(tf47_supremacy_main_var_AOObjects select _AONumber) pushBack _captureBunker3;

//////////////// Spawn AI in Capturable Bunker /////////////////////////////////////////////////////////////////////////////////////////// 

		sleep 0.1;
		nul = [_captureBunker1,2,5,[true,false],[false,false,false],true,[4,0],[0,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
		sleep 0.1;
		nul = [_captureBunker2,2,5,[true,false],[false,false,false],true,[4,0],[0,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";
		sleep 0.1;
		nul = [_captureBunker3,2,5,[true,false],[false,false,false],true,[4,0],[0,0],_ao_ai_skill_array,nil,nil,nil,1,_AONumber] execVM "LV\militarize.sqf";

//////////////// Spawn new IED's /////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
// not the job of this scipt
		[round (random 3)] call tf47_fnc_spawnIED;
*/

//////////////// create trigger at the ao ////////////////////////////////////////////////////////////////////////////////////////			
		
sleep 1;
_missionComplete_trig = createTrigger 		["EmptyDetector", getPos _log_pos, false];
_missionComplete_trig setTriggerArea 		[_ao_rad, _ao_rad, 0, false];
_missionComplete_trig setTriggerActivation 	["ANY", "PRESENT", false];
_missionComplete_trig setVariable 			["AONumber",_AONumber,true];
tf47_supremacy_main_var_trigger set 			[_AONumber, _missionComplete_trig];
		
_missionComplete_trig setTriggerStatements ["this && !(alive (tf47_supremacy_main_var_radiotowers select (thisTrigger getVariable ""AONumber""))) && 
(((tf47_supremacy_main_var_Bunker select (thisTrigger getVariable ""AONumber"")) select 0) getVariable ""owner"" == west) && 
(((tf47_supremacy_main_var_Bunker select (thisTrigger getVariable ""AONumber"")) select 1) getVariable ""owner"" == west) && 
(((tf47_supremacy_main_var_Bunker select (thisTrigger getVariable ""AONumber"")) select 2) getVariable ""owner"" == west) && 
(((east countSide thisList)  + (resistance countSide thisList)) <= 4)",  
"[(thisTrigger getVariable ""AONumber"")] remoteExec [""tf47_supremacy_main_fnc_completeMainObjective"",0,false]; diag_log [""Mission complete""];deletevehicle thisTrigger" , ""];


_reinforcements_trig = createTrigger		["EmptyDetector", getPos _log_pos, true];
_reinforcements_trig setTriggerArea			[_ao_rad, _ao_rad, 0, false];
_reinforcements_trig setTriggerActivation	["WEST", "EAST D", true];
_reinforcements_trig setTriggerTimeout		[15, 60, 120, false];
_reinforcements_trig setVariable			["AONumber",_AONumber,true];
_reinforcements_trig setVariable			["RadioTower",(tf47_supremacy_main_var_radiotowers select _AONumber),true];

tf47_supremacy_main_var_reinforcementTriggers set [_AONumber, _reinforcements_trig];	
	
_reinforcements_trig setTriggerStatements ["this && alive (thisTrigger getVariable ""RadioTower"" )",  
"[(thisTrigger getVariable ""AONumber"")] remoteExec [""tf47_supremacy_main_fnc_reinforcements"",0,false]; diag_log [""start reinforcements""]" , ""];


if ((date select 3 >= 20) || (date select 3 < 5) ) then {
	[] spawn tf47_supremacy_main_fnc_buildSubstation;};


diag_log format ["Main Mission in %1 initialised", _ao_name ];


//found no easy way to synchronize all spawned scripts
sleep 120;
tf47_supremacy_main_var_missionCreationOngoing set [_AONumber,false];
	
