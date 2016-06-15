/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

>> sends helicopter carrying troops to the AO (parajump)

parameter: []
------------------------------------------------------------------------------------
*/

if(!isServer) exitwith {};

_phi = 210 + random 300;
_r = 12000;
_AOPos = getMarkerPos "ao_mkr1";
_spawnPos = [(sin(_phi)* _r) + (_AOPos select 0), (cos(_phi)* _r) + (_AOPos select 1)];

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
		["RHS_Mi8amt_chdkz"] call BIS_fnc_selectRandom;
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
		"rhs_vdv_des_machinegunner","rhs_vdv_des_arifleman","rhs_vdv_des_medic",
		"rhs_vdv_des_junior_sergeant","rhs_vdv_des_RShG2","rhs_vdv_des_grenadier",
		"rhs_vdv_des_aa","rhs_vdv_des_LAT","rhs_vdv_des_grenadier_rpg","rhs_vdv_des_machinegunner_assistant",
		"rhs_vdv_des_marksman"];
	};
};

_veh = createVehicle [_veh, _spawnPos, [], 50, "FLY"];

_grp = createGroup east;
[_veh, _grp] call BIS_fnc_spawnCrew;

_wp = _grp addWaypoint [[(sin(_phi)* random 500) + (_AOPos select 0), (cos(_phi)* random 500) + (_AOPos select 1)], 1];
[_grp, 1] setWaypointSpeed "FAST";
[_grp, 1] setWaypointType "MOVE";
[_grp, 2] setWaypointBehaviour "CARELESS";
[_grp, 1] setWaypointStatements ["true", "[this] spawn tf47_fnc_cargoToPara"];

_wp = _grp addWaypoint [_spawnPos, 2];
[_grp, 2] setWaypointType "MOVE";
[_grp, 2] setWaypointSpeed "FAST";
[_grp, 2] setWaypointBehaviour "CARELESS";
[_grp, 2] setWaypointStatements ["true", "deleteVehicle vehicle this; { deleteVehicle _x} forEach (units (group this));"];


tf47_var_AOObjects pushBack _veh;
{
	tf47_var_AOUnits pushBack _x;
} forEach (crew _veh);

_grp = createGroup east;

{
	_unit = _grp createUnit [_x, [0,0], [], 0, "FLY"];
	_unit moveInCargo _veh;
	_unit addBackpack "B_Parachute";
	tf47_var_AOUnits pushBack _unit;
} forEach _inf;

[_grp, getmarkerpos 'ao_mkr1', (350 + random 200)] call bis_fnc_taskPatrol;

