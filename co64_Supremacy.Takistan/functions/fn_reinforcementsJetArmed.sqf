/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

>> sends armed jet to AO

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
		["RHS_Su25SM_KH29_vvsc","RHS_Su25SM_CAS_vvsc","RHS_Su25SM_vvsc"] call BIS_fnc_selectRandom;
	};
};

_veh = createVehicle [_veh, _spawnPos, [], 50, "FLY"];

tf47_var_reinforcements_jetArmed = _veh;

_grp = createGroup east;
[_veh, _grp] call BIS_fnc_spawnCrew;

_wp = _grp addWaypoint [[(sin(_phi)* random 500) + (_AOPos select 0), (cos(_phi)* random 500) + (_AOPos select 1)], 1];
[_grp, 1] setWaypointType "MOVE";
[_grp, 1] setWaypointSpeed "FAST";
[_grp, 1] setWaypointStatements ["true", "[group this, getmarkerpos 'ao_mkr1', (1000 + random 2000)] call bis_fnc_taskPatrol;"];

tf47_var_AOObjects pushBack _veh;
{
	tf47_var_AOUnits pushBack _x;
} forEach (crew _veh);