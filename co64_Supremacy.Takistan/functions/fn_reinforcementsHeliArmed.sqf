/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

>> sends armed helicopter to AO

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
		["RHS_Mi8amt_chdkz","RHS_Mi24P_vvs","RHS_Mi8AMTSh_UPK23_vvs","RHS_Mi24P_CAS_vvs"] call BIS_fnc_selectRandom;
	};
};

_veh = createVehicle [_veh, _spawnPos, [], 50, "FLY"];

tf47_var_reinforcements_heliArmed = _veh;

_grp = createGroup east;
[_veh, _grp] call BIS_fnc_spawnCrew;

_wp = _grp addWaypoint [[(sin(_phi)* random 500) + (_AOPos select 0), (cos(_phi)* random 500) + (_AOPos select 1)], 1];
[_grp, 1] setWaypointType "MOVE";
[_grp, 1] setWaypointSpeed "FAST";
[_grp, 1] setWaypointStatements ["true", "[group this, getmarkerpos 'ao_mkr1', (350 + random 1000)] call bis_fnc_taskPatrol;"];

tf47_var_AOObjects pushBack _veh;
{
	tf47_var_AOUnits pushBack _x;
} forEach (crew _veh);

