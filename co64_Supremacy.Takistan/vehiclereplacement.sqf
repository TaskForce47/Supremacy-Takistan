private ["_nlaw","_rifle","_dmr","_drone","_machinegun","_timeondesertionsmall","_timeondestructionsmall","_timeondesertion","_timeondestruction","_mkrname","_mkrpos","_mkrdir","_mkrtext","_veh","_quad","_bike","_tractor","_unarmedcars","_hmmwv_toc","_hmmwv_transport","_hmmwv_m2","_hmmwv_mk19","_hmmwv_tow","_hmmwv_avenger","_hmmwv_mk19_crows","_rg31_m2","_dingo_m2","_dingo_gl","_landrover_cz","_landrover_gb","_landrover_transport","_dingo_cz","_jackal2_gmg","_jackal2_l2a1","_refuel","_reammo","_repair","_transport","_rhino01","_rhino02","_lion01","_lion02","_frog01","_tiger01","_tiger02","_tiger03","_gator01","_gator02","_butterfly01","_butterfly02","_firefly","_manticore","_griffin","_raven01","_raven02","_dustoff","_pelican","_goose","_albatros","_wasp01","_eagle01","_thunderbird","_evileye","_ambulance","_basedef_tank","_basedef_static_aa","_basedef_avenger","_basedef_static_mg","_missilebox"];

if(!isServer) exitwith {
	//hint "not the Server!";
	};
waitUntil {!isNil "tf47_param_vehiclemod"};
switch (tf47_param_vehiclemod) do { 
	case 0 : { 
		#include "vehicleReplacement\vanillaVehicles.sqf" 
		}; 
	case 1 : { 
		#include "vehicleReplacement\CUPVehicles.sqf" 
		}; 
	case 2 : { 
		#include "vehicleReplacement\RHSVehicles.sqf" 
		}; 
};
//#include "functions\vehicleReplacement\vanillaVehicles.sqf"
for "_i" from 0 to 150 do {
_mkrname = format ["mkr_spawn_veh_%1",_i];
_mkrpos = getMarkerPos _mkrname;
_mkrdir = markerDir _mkrname;
_mkrtext = markerText _mkrname;
_timeondestructionsmall = 60;
_timeondesertionsmall = 120;
_timeondestruction = 360;
_timeondesertion = 600;
switch (_mkrtext) do  {
	case "_quad" : {
		_veh = [_mkrpos,_mkrdir,_quad] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [_veh, _timeondestructionsmall, _timeondesertionsmall, "", "mil_dot", "ColorBLUFOR", WEST, "", 1] execVM "tf47CoreScripts\vehicleRespawn.sqf"; 
		_veh setVariable ["R3F_LOG_disabled", true];
		};
	case "_bike" :  {
		_veh = [_mkrpos,_mkrdir,_bike] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestructionsmall,_timeondesertionsmall, "", "mil_dot", "ColorBLUFOR", WEST, "", 1] execVM "tf47CoreScripts\vehicleRespawn.sqf"; 
		_veh setVariable ["R3F_LOG_disabled", true];
		};
	case "_tractor" : {
		_veh = [_mkrpos,_mkrdir,_tractor] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestructionsmall,_timeondesertionsmall, "Towing Tractor", "mil_dot", "ColorBLUFOR", WEST, "", 1] execVM "tf47CoreScripts\vehicleRespawn.sqf"; 
		//[_veh] execVM "tf47CoreScripts\towingTractor\initTowingTractor.sqf";
		_veh setVariable ["R3F_LOG_disabled", true];
		createVehicleCrew _veh;
		};
	case "_hmmwv_transport" : {
		_veh = [_mkrpos,_mkrdir,_hmmwv_transport] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 5] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_hmmwv_avenger" : {
		_veh = [_mkrpos,_mkrdir,_hmmwv_avenger] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, "Avenger", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_hmmwv_tow" : {
		_veh = [_mkrpos,_mkrdir,_hmmwv_tow] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_hmmwv_mk19" : {
		_veh = [_mkrpos,_mkrdir,_hmmwv_mk19] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_hmmwv_m2" : {
		_veh = [_mkrpos,_mkrdir,_hmmwv_m2] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_hmmwv_mk19_crows" : {
		_veh = [_mkrpos,_mkrdir,_hmmwv_mk19_crows] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_rg31_m2" : {
		_veh = [_mkrpos,_mkrdir,_rg31_m2] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_landrover_cz" : {
		_veh = [_mkrpos,_mkrdir,_landrover_cz] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_landrover_gb" : {
		_veh = [_mkrpos,_mkrdir,_landrover_gb] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_dingo_gl" : {
		_veh = [_mkrpos,_mkrdir,_dingo_gl] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_dingo_m2" : {
		_veh = [_mkrpos,_mkrdir,_dingo_m2] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_landrover_transport" : {
		_veh = [_mkrpos,_mkrdir,_landrover_transport] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnvehspawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 5] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_jackal2_l2a1" : {
		_veh = [_mkrpos,_mkrdir,_jackal2_l2a1] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_jackal2_gmg" : {
		_veh = [_mkrpos,_mkrdir,_jackal2_gmg] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [_veh, _timeondestruction, _timeondesertion, " ", "mil_dot", "ColorBLUFOR", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_refuel" : {
		_veh = [_mkrpos,_mkrdir,_refuel] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [_veh, _timeondestruction, _timeondesertion, "Fuel", "mil_dot", "ColorBLUFOR", WEST, "", 20] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_reammo" : {
		_veh = [_mkrpos,_mkrdir,_reammo] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [_veh, _timeondestruction, _timeondesertion, "Reammo", "mil_dot", "ColorBLUFOR", WEST, "", 20] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_repair" : {
		_veh = [_mkrpos,_mkrdir,_repair] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [_veh, _timeondestruction, _timeondesertion, "Repair", "mil_dot", "ColorBLUFOR", WEST, "", 20] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_transport" : {
		_veh = [_mkrpos,_mkrdir,_transport] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [_veh, _timeondestruction, _timeondesertion, "Transport", "mil_dot", "ColorBLUFOR", WEST, "", 8] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		};
	case "_ambulance" : {
		_veh = [_mkrpos,_mkrdir,_ambulance] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [_veh, _timeondestruction, _timeondesertion, "Ambulance", "mil_dot", "ColorRed", WEST, "", 10] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil= _veh setvariable ["ace_medical_isMedicalVehicle", true];
		};
	case "_hmmwv_toc" :{
		tochmmwv = [_mkrpos,_mkrdir,_hmmwv_toc] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [tochmmwv, _timeondestruction, _timeondesertion, "TOC", "mil_dot", "ColorBLUFOR", WEST, "", 15] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[tochmmwv,"tochmmwv"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "tochmmwv";
		};
	case "_rhino01" : {
		rhino1 = [_mkrpos,_mkrdir,_rhino01] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [rhino1, _timeondestruction, _timeondesertion, "RHINO-01", "b_mech_inf", "ColorOrange", WEST, "harmor", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[rhino1,"rhino1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "rhino1";
		};
	case "_rhino02" : {
		rhino2 = [_mkrpos,_mkrdir,_rhino02] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [rhino2, _timeondestruction, _timeondesertion, "RHINO-02", "b_mech_inf", "ColorOrange", WEST, "harmor", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[rhino2,"rhino2"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "rhino2";
		};
	case "_lion01": {
		lion1 = [_mkrpos,_mkrdir,_lion01] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [lion1, _timeondestruction, _timeondesertion, "LION-01", "b_mech_inf", "ColorOrange", WEST, "harmor", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[lion1,"lion1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "lion1";
		};
	case "_lion02" : {
		lion2 = [_mkrpos,_mkrdir,_lion02] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [lion2, _timeondestruction, _timeondesertion, "LION-02", "b_mech_inf", "ColorOrange", WEST, "harmor", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[lion2,"lion2"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "lion2";
		};
	case "_frog01" : {
		frog1 = [_mkrpos,_mkrdir,_frog01] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [frog1, _timeondestruction, _timeondesertion, "FROG-01", "b_mech_inf", "ColorOrange", WEST, "harmor", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[frog1,"frog1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "frog1";
		};
		
	case "_tiger01" : 		{
		/*
		tiger1 = [_mkrpos,_mkrdir,_tiger01] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [tiger1, _timeondestruction, _timeondesertion, "TIGER-01", "b_mech_inf", "ColorOrange", WEST, "larmor", 15] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[tiger1,"tiger1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "tiger1";
		*/
		};
	case "_tiger02" :		{
	/*
		tiger2 = [_mkrpos,_mkrdir,_tiger02] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [tiger2, _timeondestruction, _timeondesertion, "TIGER-02", "b_mech_inf", "ColorOrange", WEST, "larmor", 15] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		tiger2 setVehicleVarName "tiger2";
		publicVariable "tiger2";
		*/
		};
	case "_tiger03" : 		{
		/*
		tiger3 = [_mkrpos,_mkrdir,_tiger03] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [tiger3, _timeondestruction, _timeondesertion, "TIGER-03", "b_mech_inf", "ColorOrange", WEST, "larmor", 15] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[tiger3,"tiger3"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "tiger3";
		*/
		};
	case "_gator01" : 		{
		gator1 = [_mkrpos,_mkrdir,_gator01] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [gator1, _timeondestruction, _timeondesertion, "SCORPION-01", "b_mech_inf", "ColorOrange", WEST, "larmor", 15] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[gator1,"gator1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "gator1";
		};
	case "_gator02" : 		{
		gator2 = [_mkrpos,_mkrdir,_gator02] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [gator2, _timeondestruction, _timeondesertion, "SCORPION-02", "b_mech_inf", "ColorOrange", WEST, "larmor", 15] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		[[gator2,"gator2"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "gator2";
		};
	case "_butterfly01" : 	{
		butterfly1 = [_mkrpos,_mkrdir,_butterfly01] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [butterfly1, _timeondestruction, _timeondesertion, "BUTTERFLY-01", "b_air", "ColorBrown", WEST, "rottrans", 15] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [butterfly1, "BUTTERFLY-01", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[butterfly1,"butterfly1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "butterfly1";
		};
	case "_butterfly02" : 	{
		butterfly2 = [_mkrpos,_mkrdir,_butterfly02] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [butterfly2, _timeondestruction, _timeondesertion, "BUTTERFLY-02", "b_air", "ColorBrown", WEST, "rottrans", 15] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [butterfly2, "BUTTERFLY-02", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[butterfly2,"butterfly2"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "butterfly2";
		};
	case "_firefly" : 		{
		firefly1 = [_mkrpos,_mkrdir,_firefly] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [firefly1, _timeondestruction, _timeondesertion, "FIREFLY", "b_air", "ColorOrange", WEST, "rotatk", 20] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [firefly1, "FIREFLY", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[firefly1,"firefly1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "firefly1";
		};
	case "_manticore" : 	{
		manticore1 = [_mkrpos,_mkrdir,_manticore] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [manticore1, _timeondestruction, _timeondesertion, "MANTICORE", "b_air", "ColorOrange", WEST, "rotatk", 35] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [manticore1, "MANTICORE", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[manticore1,"manticore1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "manticore1";
		};
	case "_griffin" : 		{
		griffin1 = [_mkrpos,_mkrdir,_griffin] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [griffin1, _timeondestruction, _timeondesertion, "CAT", "b_air", "ColorBrown", WEST, "rottrans", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [griffin1, "CAT", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[griffin1,"griffin1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "griffin1";
		};
	case "_raven01" : 		{
		raven1 = [_mkrpos,_mkrdir,_raven01] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [raven1, _timeondestruction, _timeondesertion, "RAVEN-01", "b_air", "ColorBrown", WEST, "rottrans", 20] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [raven1, "RAVEN-01", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[raven1,"raven1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "raven1";
		};
	case "_raven02" : 		{
		raven2 = [_mkrpos,_mkrdir,_raven02] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [raven2, _timeondestruction, _timeondesertion, "MERLIN", "b_air", "ColorBrown", WEST, "rottrans", 20] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [raven2, "MERLIN", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[raven2,"raven2"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "raven2";
		};
	case "_dustoff" : 		{
		dustoff = [_mkrpos,_mkrdir,_dustoff] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [dustoff, _timeondestruction, _timeondesertion, "DUSTOFF", "b_air", "ColorRed", WEST, "rottrans", 30] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [dustoff, "DUSTOFF", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		hNil= dustoff setvariable ["ace_medical_isMedicalVehicle", true];
		[[dustoff,"dustoff"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "dustoff";
		};
	case "_pelican" : 		{
		pelican1 = [_mkrpos,_mkrdir,_pelican] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [pelican1, _timeondestruction, _timeondesertion, "PELICAN", "b_air", "ColorBrown", WEST, "rottrans", 20] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [pelican1, "PELICAN", "b_air", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[pelican1,"pelican1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "pelican1";
		};
	case "_goose" : 		{
		goose1 = [_mkrpos,_mkrdir,_goose] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [goose1, _timeondestruction, _timeondesertion, "SEAGULL", "b_air", "ColorBrown", WEST, "rottrans", 30] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [goose1, "SEAGULL", "b_plane", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[goose1,"goose1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "goose1";
		};
	case "_albatros" : 		{
		albatros1 = [_mkrpos,_mkrdir,_albatros] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [albatros1, _timeondestruction, _timeondesertion, "ALBATROS", "b_plane", "ColorOrange", WEST, "fixatk", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [albatros1, "ALBATROS", "b_plane", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[albatros1,"albatros1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "albatros1";
		};
	case "_wasp01" : 		{
		wasp1 = [_mkrpos,_mkrdir,_wasp01] call TF47_VehicleReplacement_fnc_replaceVehicle; 
		spawnveh = [wasp1, _timeondestruction, _timeondesertion, "WASP-01", "b_plane", "ColorOrange", WEST, "fixatk", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [wasp1, "WASP-01", "b_plane", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[wasp1,"wasp1"],"setVehicleVarname",true] call BIS_fnc_MP;
		wasp1 setVariable ["ITGT_NEW","no",true];
		publicVariable "wasp1";
		};
	case "_eagle01" : 		{
		eagle1 = [_mkrpos,_mkrdir,_eagle01] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [eagle1, _timeondestruction, _timeondesertion, "EAGLE-01", "b_plane", "ColorOrange", WEST, "fixatk", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [eagle1, "EAGLE-01", "b_plane", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[eagle1,"eagle1"],"setVehicleVarname",true] call BIS_fnc_MP;
		wasp1 setVariable ["ITGT_NEW","no",true];
		publicVariable "eagle1";
		};
	case "_thunderbird" :	{
		thunderbird1 = [_mkrpos,_mkrdir,_thunderbird] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [thunderbird1,_timeondestruction,_timeondesertion, "THUNDERBIRD", "b_plane", "ColorOrange", WEST, "fixatk", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [thunderbird1, "THUNDERBIRD", "b_plane", WEST, "ColorBLUFOR"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		[[thunderbird1,"thunderbird1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "thunderbird1";
		};
	case "_evileye" :	{
		evileye1 = [_mkrpos,_mkrdir,_evileye] call TF47_VehicleReplacement_fnc_replaceVehicle;
		spawnveh = [evileye1,_timeondestruction,_timeondesertion, "EVILEYE", "b_uav", "ColorOrange", WEST, "fixatk", 25] execVM "tf47CoreScripts\vehicleRespawn.sqf";
		hNil = [evileye1, "EVILEYE", "b_uav", WEST, "ColorBrown"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
		createVehicleCrew evileye1;
		[[evileye1,"evileye1"],"setVehicleVarname",true] call BIS_fnc_MP;
		publicVariable "evileye1";
		};
	case "_basedef_tank" : {
		_veh = [_mkrpos,_mkrdir,_basedef_tank] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
		_veh allowDamage false;
		_veh setFuel 0;
		createVehicleCrew _veh;
		(driver _veh) disableAI "MOVE";
		(gunner _veh) disableAI "MOVE";
		(commander _veh) disableAI "MOVE";
		_veh setFuel 0;
		_veh lock true;
	};
	case "_basedef_avenger":{
		_veh = [_mkrpos,_mkrdir,_basedef_avenger] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
		_veh allowDamage false;
		createVehicleCrew _veh;
		(driver _veh) disableAI "MOVE";
		(gunner _veh) disableAI "MOVE";
		(commander _veh) disableAI "MOVE";
		_veh setFuel 0;
		_veh lock true;
	};
	case "_basedef_static_aa":{
		_veh = [_mkrpos,_mkrdir,_basedef_static_aa] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
		_veh allowDamage false;
		createVehicleCrew _veh;
		(driver _veh) disableAI "MOVE";
		(gunner _veh) disableAI "MOVE";
		(commander _veh) disableAI "MOVE";
		_veh setFuel 0;
		_veh lock true;
	};
	case "_basedef_static_mg":{
		_veh = [_mkrpos,_mkrdir,_basedef_static_mg] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
		_veh allowDamage false;
		createVehicleCrew _veh;
		_veh lock true;
	};
	case "_missilebox":{
		_veh = [_mkrpos,_mkrdir,_missilebox] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh allowDamage false;
		_veh enableSimulationGlobal false;
	};
	case "_nlaw":{
		_veh = [_mkrpos,_mkrdir,_nlaw] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh allowDamage false;
		_veh enableSimulationGlobal false;
		_veh setPos [_mkrpos select 0,_mkrpos select 1,(_mkrpos select 2)+0.79];
	};
	case "_drone":{
		_veh = [_mkrpos,_mkrdir,_drone] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh allowDamage false;
		_veh enableSimulationGlobal false;
		_veh setPos [_mkrpos select 0,_mkrpos select 1,(_mkrpos select 2)+0.88];
	};
	case "_machinegun":{
		_veh = [_mkrpos,_mkrdir,_machinegun] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh allowDamage false;
		_veh enableSimulationGlobal false;
		_veh setPos [_mkrpos select 0,_mkrpos select 1,(_mkrpos select 2)+0.86];
		_veh setVectorDirAndUp [[0,1,0],[0,1,.33]];
	};
	case "_dmr":{
		_veh = [_mkrpos,_mkrdir,_dmr] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh allowDamage false;
		_veh enableSimulationGlobal false;
		_veh setPos [_mkrpos select 0,_mkrpos select 1,(_mkrpos select 2)+0.88];
	};
	case "_rifle":{
		_veh = [_mkrpos,_mkrdir,_rifle] call TF47_VehicleReplacement_fnc_replaceVehicle;
		_veh allowDamage false;
		_veh enableSimulationGlobal false; 
		_veh setPos [_mkrpos select 0,_mkrpos select 1,(_mkrpos select 2)+0.88];
	};
	default { 
		if (((getMarkerPos _mkrname select 0) == 0) && ((getMarkerPos _mkrname select 1) == 0) && ((getMarkerPos _mkrname select 2) == 0)) then {
			} else {
			hintC format ["Replacement did not work for Vehicle : %1 at Pos : %2",_mkrText,_mkrpos]; 
			};
		};
	};//close switch case
deleteMarker _mkrname;
};// close for



