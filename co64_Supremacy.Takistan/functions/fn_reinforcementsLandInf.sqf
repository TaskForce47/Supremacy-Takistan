/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

>> sends LASTKRAFTWAGEN carrying troops to the AO

parameter: []
------------------------------------------------------------------------------------
*/

if(!isServer) exitwith {};

tf47_var_reinforcements_heliUnarmed = 1;
_phi = 210 + random 300;
_r = 12000;
_AOPos = getMarkerPos "ao_mkr1";

_roads = [];

_pos = [0,0];

while {([_pos] call tf47_fnc_nearPlayerDist < 1500) || (_pos distance (getMarkerPos "base_spawn_1") < 1500) || (_pos isEqualTo [0,0])} do
{
	while {count _roads < 2} do
	{
		_r = 2000 + random 3000;
		_phi = random 360;
			
		_pos = [((getMarkerPos "ao_mkr1") select 0) + _r * sin(_phi),((getMarkerPos "ao_mkr1") select 1) + _r * cos(_phi)];
		_roads = _pos nearRoads 500;
		sleep 0.01;
	};
	sleep 0.01;
	_pos = getPos (_roads select 0);

};

_spawnPos = _pos;
_landPos = [_AOPos, 1, 800, 10, 0, 0.25, 0] call BIS_fnc_findSafePos;

_veh = switch (tf47_param_vehiclemod) do {
	// Van
	case 0 : {
		["I_Heli_Transport_02_F","I_Heli_light_03_F"] call BIS_fnc_selectRandom;
	};
	// CUP
	case 1 : {
		["CUP_O_Mi24_D_TK","CUP_O_Mi24_D_TK","CUP_O_Mi17_TK","CUP_O_Mi17_TK"] call BIS_fnc_selectRandom;
	};
	// RHS
	case 2 : {
		["rhsgref_ins_g_ural","rhsgref_ins_g_ural_open"] call BIS_fnc_selectRandom; // "rhsgref_ins_g_gaz66_flat","rhsgref_ins_g_gaz66o_flat"
	};
};

_inf = switch (tf47_param_vehiclemod) do { 
	// Van
	case 0 : {
		[
		"I_Soldier_AR_F","I_Soldier_AR_F","I_Soldier_AR_F","I_soldier_F","I_soldier_F","I_soldier_F",
		"I_soldier_F","I_soldier_F","I_Soldier_GL_F","I_soldier_F","I_Soldier_AA_F","I_Soldier_LAT_F",
		"I_Soldier_AT_F","I_Soldier_A_F","I_Soldier_GL_F"];
	};
	// CUP
	case 1 : {
		[
		"CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier","CUP_O_TK_Soldier","CUP_O_TK_Soldier_GL",
		"CUP_O_TK_Soldier","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier","CUP_O_TK_Soldier_AA","CUP_O_TK_Soldier_AT",
		"CUP_O_TK_Soldier_HAT","CUP_O_TK_Soldier_AMG","CUP_O_TK_Soldier_GL"];
	};
	// RHS
	case 2 : {
	[
		"rhs_vdv_des_machinegunner","rhs_vdv_des_medic",
		"rhs_vdv_des_junior_sergeant","rhs_vdv_des_RShG2","rhs_vdv_des_grenadier",
		"rhs_vdv_des_aa","rhs_vdv_des_LAT","rhs_vdv_des_grenadier_rpg","rhs_vdv_des_marksman"];
	};
};

_veh = createVehicle [_veh, _spawnPos, [], 50, "FORM"];

_grp = createGroup east;
[_veh, _grp] call BIS_fnc_spawnCrew;

_wp = _grp addWaypoint [_landPos, 1];
[_grp, 1] setWaypointSpeed "FAST";
[_grp, 1] setWaypointType "TR UNLOAD";
[_grp, 1] setWaypointBehaviour "CARELESS";

_endPos = ([] call tf47_fnc_getPatrolMarkers) call BIS_fnc_selectRandom;

_wp = _grp addWaypoint [getMarkerPos _endPos, 2];
[_grp, 2] setWaypointType "MOVE";
[_grp, 2] setWaypointSpeed "FAST";
[_grp, 2] setWaypointBehaviour "CARELESS";
[_grp, 2] setWaypointStatements ["true", "deleteVehicle vehicle this; { deleteVehicle _x} forEach (units (group this));"];


tf47_var_AOObjects pushBack _veh;
{
	tf47_var_AOUnits pushBack _x;
} forEach (crew _veh);

_grp = createGroup east;


while {_veh emptyPositions "Cargo" > 0} do
{
	if (count units _grp > 5) then
	{
		[_grp, getmarkerpos 'ao_mkr1', (350 + random 200)] call bis_fnc_taskPatrol;
		_grp = createGroup east;
	};
	_unit = _grp createUnit [_inf call BIS_fnc_selectRandom, [0,0], [], 0, "FLY"];
	_unit moveInCargo _veh;
	tf47_var_AOUnits pushBack _unit;
};

[_grp, getmarkerpos 'ao_mkr1', (350 + random 200)] call bis_fnc_taskPatrol;