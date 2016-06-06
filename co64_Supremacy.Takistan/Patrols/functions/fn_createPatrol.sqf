/*
Author:

	Lucke

Last modified:

	23/02/2016

Description:

	[_temp select 0, _temp select 2] call tf47_fnc_createPatrol;

Notes:


______________________________________________*/
private["_start","_end","_startpos","_endpos","_veh","_convoy","_startdir","_group","_inf","_temp"];
params[];

#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros_mission.hpp"

_convoy = [];

_start = PatrolMarkers call BIS_fnc_selectRandom;
_startpos = getMarkerPos _start;
while {count ([_startpos,allGroups,1000,{(side _x == west)}] call CBA_fnc_getNearest) > 0} do {
	_start = PatrolMarkers call BIS_fnc_selectRandom;
	_startpos = getMarkerPos _start;
};
_startdir = markerDir _start;

_end = PatrolMarkers call BIS_fnc_selectRandom;

while {_start == _end} do {
	_end = PatrolMarkers call BIS_fnc_selectRandom;
};

_endpos = getMarkerPos _end;
_group = createGroup resistance;

switch (tf47_param_vehiclemod) do {
	//Vanilla
	case 0 : {
		_veh = [

		];
	};
	//CUP
	case 1 : {
	};
	//RHS
	case 2 : {
		_veh = [
			"rhsgref_ins_g_zsu234",
			"rhsgref_ins_g_btr60",
			"rhsgref_ins_g_btr70",
			"rhsgref_ins_g_uaz",
			"rhsgref_ins_g_uaz_ags",
			"rhsgref_ins_g_uaz_dshkm_chdkz",
			"rhsgref_ins_g_uaz_open",
			"rhsgref_ins_g_uaz_spg9",
			"rhsgref_ins_g_bmd1",
			"rhsgref_ins_g_bmd1p",
			"rhsgref_ins_g_bmd2",
			"rhsgref_ins_g_bmp1",
			"rhsgref_ins_g_bmp1d",
			"rhsgref_ins_g_bmp1k",
			"rhsgref_ins_g_bmp1p",
			"rhsgref_ins_g_bmp2e",
			"rhsgref_ins_g_bmp2",
			"rhsgref_ins_g_bmp2d",
			"rhsgref_ins_g_bmp2k",
			"rhsgref_BRDM2_ins_g",
			"rhsgref_BRDM2_ATGM_ins_g",
			"rhsgref_BRDM2UM_ins_g",
			"rhsgref_BRDM2_HQ_ins_g",
			"rhsgref_ins_g_t72ba",
			"rhsgref_ins_g_t72bb",
			"rhsgref_ins_g_t72bc",
			"rhsgref_ins_g_BM21",
			"rhsgref_ins_g_gaz66",
			"rhsgref_ins_g_gaz66_ammo",
			"rhsgref_ins_g_gaz66_flat",
			"rhsgref_ins_g_gaz66o",
			"rhsgref_ins_g_gaz66o_flat",
			"rhsgref_ins_g_gaz66_r142",
			"rhsgref_ins_g_gaz66_zu23",
			"rhsgref_ins_g_gaz66_ap2",
			"rhsgref_ins_g_gaz66_repair",
			"rhsgref_ins_g_ural",
			"rhsgref_ins_g_ural_open",
			"rhsgref_ins_g_ural_work",
			"rhsgref_ins_g_ural_work_open",
			"rhsgref_ins_g_ural_Zu23"
		];
		_inf = [
			"rhsgref_ins_g_specialist_aa",
			"rhsgref_ins_g_grenadier_rpg",
			"rhsgref_ins_g_machinegunner",
			"rhsgref_ins_g_medic",
			"rhsgref_ins_g_militiaman_mosin",
			"rhsgref_ins_g_squadleader",
			"rhsgref_ins_g_rifleman",
			"rhsgref_ins_g_rifleman_akm",
			"rhsgref_ins_g_rifleman_aksu",
			"rhsgref_ins_g_grenadier",
			"rhsgref_ins_g_rifleman_RPG26",
			"rhsgref_ins_g_saboteur",
			"rhsgref_ins_g_engineer",
			"rhsgref_ins_g_sniper",
			"rhsgref_ins_g_spotter"
		];
	};
	default {};
};

for "_i" from 0 to ([2,7] call BIS_fnc_randomInt) do {
	_convoy pushBack (createVehicle[(_veh call BIS_fnc_selectRandom),_startpos,[],0,"CAN_COLLIDE"]);
	_startpos = _startpos getPos[10, _startdir + 180];
};

{
	_x setDir _startdir;
	createVehicleCrew _x;
	crew _x join _group;

	for "_i" from 0 to ([0, (_x emptyPositions "Cargo")] call BIS_fnc_randomInt) do {
		_temp = _group createUnit [(_inf call BIS_fnc_selectRandom), [0,0,0],[],0,"NONE"];
		_temp moveInCargo _x;
		if !(_temp in _x) then {
			[_temp] call CBA_fnc_deleteEntity;
		};
	};

} forEach _convoy;

_group setBehaviour "SAFE";
_group setCombatMode (["YELLOW","RED"] call BIS_fnc_selectRandom);
_group setSpeedMode (["LIMITED","NORMAL","FULL"] call BIS_fnc_selectRandom);
_group move _endpos;

Patrols pushBack [_group, _convoy,  _start, _end];
