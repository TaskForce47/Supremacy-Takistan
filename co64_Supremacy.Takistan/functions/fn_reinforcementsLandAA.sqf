/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

>> sends AA vehicles into AO

parameter: []
------------------------------------------------------------------------------------
*/

if(!isServer) exitwith {};

_landPos = [_AOPos, 1, 800, 10, 0, 0.25, 0] call BIS_fnc_findSafePos;

_veh = switch (tf47_param_vehiclemod) do { 
	// Van
	case 0 : {
		["I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F"];
	};
	// CUP
	case 1 : {
		[
			"CUP_O_BTR60_TK","CUP_O_BMP1_TKA","CUP_O_BMP1P_TKA","CUP_O_BMP2_TKA","CUP_O_BMP_HQ_TKA",
			"CUP_O_BMP2_ZU_TKA","CUP_O_BRDM2_TKA","CUP_O_BRDM2_ATGM_TKA","CUP_O_BRDM2_HQ_TKA","CUP_O_M113_TKA",
			"CUP_O_T34_TKA","CUP_O_T55_TK","CUP_O_T72_TKA","CUP_O_ZSU23_TK"];
	// RHS
	case 2 : {
		["rhsgref_ins_g_zsu234","rhsgref_ins_g_gaz66_zu23","rhsgref_ins_g_ural_Zu23"];
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
	_vehicle = createVehicle [_veh, _pos, [], 0, "FORM"];
	[_vehicle, _group] call BIS_fnc_spawnCrew;
	tf47_var_AOObjects pushBack _vehicle;

	{
		tf47_var_AOUnits pushBack _x;
	} forEach (crew _vehicle);

	_wp = _group addWaypoint [_landPos, 1];
	[_group, 1] setWaypointType "MOVE";
	[_group, 1] setWaypointBehaviour "SAFE";
	[_group, 1] setWaypointCompletionRadius (random 200);
	[_group, 1] setWaypointSpeed "NORMAL";
	[_group, 1] setWaypointStatements ["true", "[group this, getmarkerpos 'ao_mkr1', 300 + random 600] call bis_fnc_taskPatrol;"];

	sleep 5;
};