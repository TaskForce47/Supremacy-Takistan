/*
Author:

	Lucke

Last modified:

	23/02/2016

Description:

	[_temp select 0, _temp select 2] call tf47_fnc_createPatrol;

Notes:


______________________________________________*/
private["_typ","_timer","_start","_end","_startpos","_endpos","_veh","_convoy","_startdir","_group"];
params["_typ","_timer"];

_convoy = [];
_inf = [];
_start = PatrolMarkers call BIS_fnc_selectRandom;
PatrolMarkers = PatrolMarkers - [_start];
_end = PatrolMarkers call BIS_fnc_selectRandom;
PatrolMarkers = PatrolMarkers - [_end];
_startpos = getMarkerPos _start;
_endpos = getMarkerPos _end;
_startdir = markerDir _start;
_group = createGroup east;

switch (tf47_param_vehiclemod) do {
	case 0 : {
		switch (_typ) do {
			case "inf" : {
				_veh = ["O_MRAP_02_gmg_F", "O_MRAP_02_F", "O_MRAP_02_F",  "O_MRAP_02_hmg_F"];
			};
			case "wheeld" : {
				_veh = ["O_MRAP_02_gmg_F", "O_APC_Wheeled_02_rcws_F", "O_MRAP_02_hmg_F"];
			};
			case "tracked" : {
				_veh = ["O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F"];
			};
			default {};
		};
	};
	case 1 : {
		switch (_typ) do {
			case "inf" : {
				_veh = ["CUP_O_UAZ_MG_TKA", "CUP_O_UAZ_Unarmed_TKA", "CUP_O_LR_Transport_TKA", "CUP_O_UAZ_MG_TKA"];
			};
			case "wheeld" : {
				_veh = ["CUP_O_BRDM2_ATGM_TKA", "CUP_O_BTR60_TK", "CUP_O_BRDM2_TKA"];
			};
			case "tracked" : {
				_veh = ["CUP_O_BMP2_TKA", "CUP_O_BMP2_ZU_TKA", "CUP_O_BMP2_TKA"];
			};
			default {};
		};

	};
	case 2 : {
		switch (_typ) do {
			case "inf" : {
				_veh = ["rhsgref_cdf_reg_uaz_dshkm", "rhsgref_ins_g_ural_Zu23", "rhsgref_BRDM2_ins_g", "rhsgref_cdf_reg_uaz_dshkm"];
			};
			case "wheeld" : {
				_veh = ["rhsgref_ins_g_btr70", "rhsgref_ins_g_zsu234", "rhsgref_ins_g_btr70"];
			};
			case "tracked" : {
				_veh = ["rhsgref_ins_g_bmp2k", "rhsgref_ins_g_zsu234", "rhsgref_ins_g_bmp2k"];
			};
			default {};
		};

	};
	default {};
};

{
	_convoy = _convoy + [createVehicle[_x,_startpos,[],0,"CAN_COLLIDE"]];
	_startpos = _startpos getPos[10, _startdir + 180];
} forEach _veh;

{
	_x setDir _startdir;
	createVehicleCrew _x;
	crew _x join _group;
} forEach _convoy;

_group setBehaviour "CARELESS";
_group setCombatMode "YELLOW";
_group setSpeedMode "NORMAL";
//_group move _endpos;
[_group, _endpos] execVM "Patrols\delayedwaypoint.sqf";

Patrols = Patrols + [[_typ,_timer,_group, _convoy, _inf, _start, _end]];
