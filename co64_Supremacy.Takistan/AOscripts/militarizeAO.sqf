////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																																  //
//                      		***		ARMA3 Domination-Like-Script v1.0 - by Sepp	***											  //
//																																  //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////// Exit if not server /////////////////////////////////////////////////////////////////////////////////////////////
if(!([] call TF47_Helper_fnc_checkForHc)) exitwith {};


//////////////// Mission Ending /////////////////////////////////////////////////////////////////////////////////////////////////

if (tf47_var_mainCount >= tf47_param_mainCount) then
{
	sleep 10;
	remoteExec ['tf47_fnc_outroShot', 0];
	sleep 22;
	[1] call f_fnc_mpEnd;
};

if (tf47_var_mainCount >= tf47_param_mainCount) exitWith {};


//////////////// Increase Main Mission Counter //////////////////////////////////////////////////////////////////////////////////

tf47_var_mainCount = tf47_var_mainCount + 1;


//////////////// Declare Variables  /////////////////////////////////////////////////////////////////////////////////////////////

private ["_Playertext", "_NumOfPlayers", "_ao_select", "_ao_mkr", "_trig", "_trig_rt", "_log_pos", "_ao_task", "_mkr_text", "_ao_name", "_ao_rad", "_position","_flatPos", "_ao_iniText", "_mission_complete", "_mission_new","_ao_ai_skill_array","_ao_pilot_skill_array"];



_ao_select			= "";
_ao_mkr				= "";
_trig				= "";
_log_pos			= 0;
_mkr_text 			= "";
_ao_name 			= "";
_ao_rad 			= 350;

_ao_ai_skill_array  = [0.3,0.5,0.3,0.7,0.5,1,0.8,0.5,0.5,0.5]; // [aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed];
_ao_pilot_skill_array = [0.4,0.5,0.5,0.5,0.5,1,1,1,1,0.5];

//////////////// Count all playable Blufor Units /////////////////////////////////////////////////////////////////////////////////

_NumOfPlayers = west countSide playableUnits;


//////////////// Random Selects the AO  //////////////////////////////////////////////////////////////////////////////////////////

_oldAO = getMarkerPos "ao_mkr1";
sleep 1;
_newAO = _oldAO;

while {_oldAO distance _newAO < 3000} do
{
	_ao_select = tf47_var_AOCollection call BIS_fnc_selectRandom;
	_newAO = call compile format["log_%1", _ao_select];
};

tf47_var_AOCollection = tf47_var_AOCollection - [_ao_select];

//////////////// Deletes/Moves all remaining Marker/Object/Trigger ////////////////////////////////////////////////////////////////////

		{
			deleteVehicle _x;
			sleep 0.1;
		} forEach tf47_var_AOObjects;

		{
			deleteVehicle _x;
			sleep 0.1;
		} forEach tf47_var_AOUnits;

		tf47_var_AOObjects = [];
		tf47_var_AOUnits = [];

		"ao_mkr1" setmarkerpos [0,0,0];
		sleep 1;
		[trig_rt setpos [0,0,0]] call BIS_fnc_MP;
		sleep 1;

        deleteMarker "BunkerMarker1";
		sleep 0.1;
        deleteMarker "BunkerMarker2";
		sleep 0.1;
        deleteMarker "BunkerMarker3";
		sleep 30;

diag_log format ["New Main Mission in: %1", _ao_select];

//////////////// AO is timurkulay ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "timurkulay") then {
									_log_pos   			= log_timurkulay;
									//_ao_rad    			= 200;
									//_mkr_text  		=
									_ao_name   		= "Timurkulay";
									//_ao_array_member 	= "timurkulay";

									sleep 1;

};

//////////////// AO is chadarakht ////////////////////////////////////////////////////////////////////////////////////////////////
/*if ( _ao_select == "chadarakht") then {
									_log_pos   			= log_chadarakht;
									//_ao_rad    			= 300;
									//_mkr_text 	 	=
									_ao_name   			= "Chadarakht";
									//_ao_array_member 	= "chadarakht";

									sleep 1;

};
*/
//////////////// AO is gamarud ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "gamarud") then {
									_log_pos   			= log_gamarud;
									//_ao_rad    			= 200;
									_ao_name   		= "Gamarud";
									sleep 1;

};

//////////////// AO is gamsar ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "gamsar") then {
									_log_pos   			= log_gamsar;
									//_ao_rad    			= 350;
									_ao_name   		= "Garmsar";
									sleep 1;

};

//////////////// AO is imarat ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "imarat") then {
									_log_pos   			= log_imarat;
									//_ao_rad    			= 150;
									//_mkr_text  		=
									_ao_name   		= "Imarat";
									//_ao_array_member 	= "imarat";

									sleep 1;

};

//////////////// AO is zavarak ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "zavarak") then {
									_log_pos   			= log_zavarak;
									//_ao_rad    			= 250;
									//_mkr_text 	 	=
									_ao_name   			= "Zavarak";
									//_ao_array_member 	= "zavarak";

									sleep 1;

};

//////////////// AO is karachinar ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "karachinar") then {
									_log_pos   			= log_karachinar;
									//_ao_rad    			= 250;
									_ao_name   			= "Karachinar";
									sleep 1;

};

//////////////// AO is ravanay ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "ravanay") then {
									_log_pos   			= log_ravanay;
									//_ao_rad    			= 200;
									_ao_name   			= "Ravanay";
									sleep 1;

};

//////////////// AO is nagara ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "nagara") then {
									_log_pos   			= log_nagara;
									//_ao_rad    			= 200;
									//_mkr_text  		=
									_ao_name   		= "Nagara";
									//_ao_array_member 	= "nagara";

									sleep 1;

};

//////////////// AO is shamali ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "shamali") then {
									_log_pos   			= log_shamali;
									//_ao_rad    			= 150;
									//_mkr_text 	 	=
									_ao_name   			= "Shamali";
									//_ao_array_member 	= "shamali";

									sleep 1;

};

//////////////// AO is airfield ////////////////////////////////////////////////////////////////////////////////////////////////
/*
if ( _ao_select == "airfield") then {
									_log_pos   			= log_airfield;
									//_ao_rad    			= 300;
									_ao_name   			= "Rasman Airfield";
									sleep 1;

};
*/
//////////////// AO is rasman ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "rasman") then {
									_log_pos   			= log_rasman;
									//_ao_rad    			= 250;
									_ao_name   			= "Rasman";
									sleep 1;

};

//////////////// AO is bastam ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "bastam") then {
									_log_pos   			= log_bastam;
									//_ao_rad    			= 200;
									_ao_name   			= "Bastam";
									sleep 1;

};

//////////////// AO is falar ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "falar") then {
									_log_pos   			= log_falar;
									//_ao_rad    			= 250;
									_ao_name   			= "Falar";
									sleep 1;

};

//////////////// AO is mulladost ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "mulladost") then {
									_log_pos   			= log_mulladost;
									//_ao_rad    			= 200;
									_ao_name   			= "Mulladost";
									sleep 1;

};

//////////////// AO is nur ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "nur") then {
									_log_pos   			= log_nur;
									//_ao_rad    			= 350;
									_ao_name   			= "Nur";
									sleep 1;

};

//////////////// AO is Feruz Abad ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "feruz") then {
									_log_pos   			= log_feruz;
									//_ao_rad    			= 250;
									//_mkr_text  		=
									_ao_name   			= "Feruz Abad";
									//_ao_array_member 	= "feruz";

									sleep 1;

};

//////////////// AO is Jilavur ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "jilavur") then {
									_log_pos   			= log_jilavur;
									//_ao_rad    			= 150;
									//_mkr_text 	 	=
									_ao_name   			= "Jilavur";
									//_ao_array_member 	= "jilavur";

									sleep 1;

};

//////////////// AO is Chak Chak ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "chak") then {
									_log_pos   			= log_chak;
									//_ao_rad    			= 300;
									_ao_name   			= "Chak Chak";
									sleep 1;

};

//////////////// AO is landay ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "landay") then {
									_log_pos   			= log_landay;
									//_ao_rad    			= 200;
									_ao_name   			= "Landay";
									sleep 1;

};

//////////////// AO is shukurkalay ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "shukukurlay") then {
									_log_pos   			= log_shukukurlay;
									//_ao_rad    			= 300;
									_ao_name   			= "Shukukurlay";
									sleep 1;

};

//////////////// AO is chaman ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "chaman") then {
									_log_pos   			= log_chaman;
									//_ao_rad    			= 200;
									_ao_name   			= "Chaman";
									sleep 1;

};

//////////////// AO is sakhe ////////////////////////////////////////////////////////////////////////////////////////////////
if ( _ao_select == "sakhe") then {
									_log_pos   			= log_sakhe;
									//_ao_rad    			= 350;
									_ao_name   			= "Sakhe";
									sleep 1;

};

//////////////// Spawn Enemy AI in AO ////////////////////////////////////////////////////////////////////////////////////

		nul = [_log_pos,2,true,2,[6,6],_ao_rad,_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\fillHouse.sqf";
 		nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],false,[35,20],[0,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
 		nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
        nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
        nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
        nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
        nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
 		nul = [_log_pos,2,_ao_rad,[true,false],[false,false,true],false,[0,0],[1,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
		nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,1],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
		nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,1],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
		nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],true,[0,0],[1,1],_ao_pilot_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
		nul = [_log_pos,2,_ao_rad,[true,false],[false,false,true],false,[0,0],[1,1],_ao_pilot_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
 		[getPos _log_pos, 200, 1000, round (1 + random 3), 1] call tf47_fnc_sniperTeam;

		nul = [_log_pos] spawn tf47_fnc_static;

//////////////// creates a visible marker for the ao //////////////////////////////////////////////////////////////////////////

//////////////// moves a visible marker to the ao //////////////////////////////////////////////////////////////////////////

		"ao_mkr1" setmarkerpos getpos _log_pos;

//////////////// creates a task/show notification for the ao ///////////////////////////////////////////////////////////////////////////////////////

["tsk1", true, ["Seize the Village held by hostile forces","Seize the AO","Main Mission"],getMarkerPos "ao_mkr1", "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;

//////////////// Hint for completed Main Mission ///////////////////////////////////////////////////////////////////////////////////////////

ao_endText = format
	[
		"<t align='center' size='1.5'>Mission Completed!</t><br/><t size='1' align='center' color='#01DF01'>%1</t><br/>____________________<br/>Congratulations, you've managed to Seize %1!<br/><br/> Outstanding work, Soldiers!",
		_ao_name
	];


//////////////// Hint for active Main Mission ///////////////////////////////////////////////////////////////////////////////////////////

_ao_iniText = format
	[
		"<t align='center' size='1.5'>New Target</t><br/><t size='1' align='center' color='#FF0000'>%1</t><br/>____________________<br/>New Mission available near %1 !<br/><br/>Destroy the enemy's Radio Tower to stop them from calling in Reinforcements. <br/><br/> Also watch out for Enemy Bunker, check your Map to see their exact Location.",
		_ao_name
	];

	//-------------------------------------------- Show global target start hint

	[_ao_iniText] remoteExec ["SEPP_fnc_globalHint",0,false];


//////////////// Sound for Hint for active Main Mission ///////////////////////////////////////////////////////////////////////////////////////////

sleep 0.1;

["mission_new"] remoteExec ["SEPP_fnc_globalsound",0,false];

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
		radiotower = "Land_Ind_IlluminantTower" createVehicle _flatPos;  // A3 Tower: "Land_TTowerBig_2_F"
	}
	else
	{
		radiotower = "Land_TTowerBig_2_F" createVehicle _flatPos;
	};

	waitUntil { sleep 0.5; alive radioTower };
	radiotower setVectorUp [0,0,1];
	radiotowerAlive = true;

	tf47_var_AOObjects pushBack radiotower;

//////////////// create 2 ai patrol around radiotower /////////////////////////////////////////////////////////////////////////

		sleep 0.1;
		nul = [radiotower,2,20,[true,false],[false,false,false],false,[2,0],[0,0],"default",nil,nil,nil,1] execVM "LV\militarize.sqf";


//////////////// create a helipad /////////////////////////////////////////////////////////////////////////////////////////////

	_poshelipad = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
	_flatPoshelipad = _poshelipad isFlatEmpty[15, 1, 0.3, 30, 0, false];

	while {(count _flatPoshelipad) < 1} do {
		_poshelipad = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
		_flatPoshelipad = _poshelipad isFlatEmpty[15, 1, 0.3, 30, 0, false];
	};

	helipad = "Land_HelipadEmpty_F" createVehicle _flatPoshelipad;
	waitUntil { sleep 0.5; alive helipad };
	helipadAlive = true;

	tf47_var_AOObjects pushBack helipad;

//////////////// moves reinforcement trigger to the ao ///////////////////////////////////////////////////////////////////////////

sleep 1;

trig_rt setpos (getpos _log_pos);


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

		captureBunker1 = [_flatBunkerpos,5,"Land_fortified_nest_big_EP1", 30, east] call compileFinal preprocessFileLineNumbers "dyncap\createCaptureLocation1.sqf";

		tf47_var_AOObjects pushBack captureBunker1;

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

		captureBunker2 = [_flatBunkerpos,5,"Land_fortified_nest_big_EP1", 30, east] call compileFinal preprocessFileLineNumbers "dyncap\createCaptureLocation2.sqf";

		tf47_var_AOObjects pushBack captureBunker2;

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

		captureBunker3 = [_flatBunkerpos,5,"Land_fortified_nest_big_EP1", 30, east] call compileFinal preprocessFileLineNumbers "dyncap\createCaptureLocation3.sqf";

		tf47_var_AOObjects pushBack captureBunker3;

//////////////// Spawn AI in Capturable Bunker ///////////////////////////////////////////////////////////////////////////////////////////

		sleep 0.1;
		nul = [captureBunker1,2,5,[true,false],[false,false,false],true,[4,0],[0,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
		sleep 0.1;
		nul = [captureBunker2,2,5,[true,false],[false,false,false],true,[4,0],[0,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";
		sleep 0.1;
		nul = [captureBunker3,2,5,[true,false],[false,false,false],true,[4,0],[0,0],_ao_ai_skill_array,nil,nil,nil,1] execVM "LV\militarize.sqf";



//////////////// Spawn new IED's /////////////////////////////////////////////////////////////////////////////////////////////////////////

		[10] call tf47_fnc_spawnIED;


//////////////// create trigger at the ao ////////////////////////////////////////////////////////////////////////////////////////

		sleep 1;

		_trig = createTrigger 					["EmptyDetector", getPos _log_pos, false];
		_trig setTriggerArea 					[_ao_rad, _ao_rad, 0, false];
		_trig setTriggerActivation 				["ANY", "PRESENT", true];
		_trig setTriggerStatements 				["this && !(alive radiotower) && (captureBunker1 getVariable ""owner"" == west) && (captureBunker2 getVariable ""owner"" == west) && (captureBunker3 getVariable ""owner"" == west) && (((east countSide thisList)  + (resistance countSide thisList)) <= 4)", "[[[],""AOscripts\militarizeAO.sqf""],""BIS_fnc_execVM""] call BIS_fnc_MP; [ao_endText] remoteExec [""SEPP_fnc_globalHint"",0,false]; [""mission_complete""] remoteExec [""SEPP_fnc_globalsound"",0,false]; [""tsk1"", true, ['Seize the Village held by hostile forces','Seize the AO',""Main Mission""],getMarkerPos ""ao_mkr1"", ""SUCCEEDED"", 1, true, true,"""",true] call BIS_fnc_setTask; [""tf47_changetickets"", [WEST, 2, 10]] call CBA_fnc_globalEvent; deletevehicle thisTrigger; AOcount = AOcount + 1" , ""];

		if ((date select 3 >= 20) || (date select 3 < 5) ) then {
   			[] spawn tf47_fnc_buildSubstation;
		};

diag_log format ["Main Mission in %1 initialised", _ao_select];
