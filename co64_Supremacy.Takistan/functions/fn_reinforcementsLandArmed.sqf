/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

>> sends armed vehicles into AO

parameter: []
------------------------------------------------------------------------------------
*/

if(!isServer) exitwith {};
_landPos = [_AOPos, 1, 300, 10, 0, 0.25, 0] call BIS_fnc_findSafePos;
_tanks = switch (tf47_param_vehiclemod) do { 
	// Van
	case 0 : {
		[
			["I_APC_tracked_03_cannon_F",3],
			["I_MBT_03_cannon_F",3],
			["I_APC_Wheeled_03_cannon_F",3],
			["I_MRAP_03_F",3],
			["I_MRAP_03_gmg_F",3],
			["I_MRAP_03_hmg_F",3]
			];
	};
	// CUP
	case 1 : {
		[
			["CUP_O_BTR60_TK",3],
			["CUP_O_BMP1_TKA",3],
			["CUP_O_BMP1P_TKA",3],
			["CUP_O_BMP2_TKA",3],
			["CUP_O_BMP_HQ_TKA",3],
			["CUP_O_BMP2_ZU_TKA",3],
			["CUP_O_BRDM2_TKA",2],
			["CUP_O_BRDM2_ATGM_TKA",2],
			["CUP_O_BRDM2_HQ_TKA",2],
			["CUP_O_M113_TKA",2],
			["CUP_O_T34_TKA",3],
			["CUP_O_T55_TK",3],
			["CUP_O_T72_TKA",3],
			["CUP_O_ZSU23_TK",3]
		];
	};
	// RHS
	case 2 : {
		[
			["rhsgref_ins_g_btr70",3],
			["rhsgref_ins_g_btr60",3],
			["rhsgref_ins_g_uaz_dshkm_chdkz",2],
			["rhsgref_ins_g_uaz_ags",2],
			["rhsgref_ins_g_uaz_spg9",2],
			["rhsgref_ins_g_bmp2k",2],
			["rhsgref_ins_g_bmp2e",2],
			["rhsgref_BRDM2_ins_g",2],
			["rhsgref_BRDM2_ATGM_ins_g",2],
			["rhsgref_ins_g_t72ba",3],
			["rhsgref_ins_g_zsu234",3]
		];
	};
};

_roads = [];

_pos = [0,0];

while {([_pos] call tf47_fnc_nearPlayerDist < 1500) || (_pos distance (getMarkerPos "base_spawn_1") < 1500) || (_pos isEqualTo [0,0])} do
{
	while {count _roads < 2} do
	{
		_r = 2500 + random 1500;
		_phi = random 360;
		
		_pos = [((getMarkerPos "ao_mkr1") select 0) + _r * sin(_phi),((getMarkerPos "ao_mkr1") select 1) + _r * cos(_phi)];
		_roads = _pos nearRoads 500;
		sleep 0.01;
	};

	sleep 0.01;

	_pos = getPos (_roads select 0);
};
_num = 1 + round(random 1);
_safe = random 1;
for [{_i=0}, {_i<_num}, {_i=_i+1}] do
{
	_group = createGroup east;
	_veh = _tanks call BIS_fnc_selectRandom;
	_vehicle = createVehicle [_veh select 0, _pos, [], 0, "FORM"];
	[_vehicle, _group] call BIS_fnc_spawnCrew;
	tf47_var_AOObjects pushBack _vehicle;

	{
		tf47_var_AOUnits pushBack _x;
	} forEach (crew _vehicle);

	_wp = _group addWaypoint [_landPos, 1];
	[_group, 1] setWaypointType "MOVE";
	[_group, 1] setWaypointBehaviour "SAFE";
	[_group, 1] setWaypointFormation "COLUMN";
	[_group, 1] setWaypointCompletionRadius (200 + random 750);
	[_group, 1] setWaypointSpeed "NORMAL";

	[_group, 1] setWaypointStatements ["true", "[group this, getmarkerpos 'ao_mkr1', 300 + random 600] call bis_fnc_taskPatrol;"];

	sleep 5;
};
