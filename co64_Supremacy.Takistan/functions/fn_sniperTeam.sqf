 /*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

spawns sniper teams at overwatch position

parameter: [AOCenter, mindist, maxdist, number, missionType]
------------------------------------------------------------------------------------
*/

private ["_AOCenter","_minDist","_maxDist","_number","_pos","_unit","_group","_missionType","_spotter","_sniper","_sniper2"];
params ["_AOCenter","_minDist","_maxDist","_number","_missionType"];

_spotter = "";
_sniper = "";
_sniper2 = "";

switch (tf47_param_vehiclemod) do {
	// Van
	case 0 : {
		_spotter = "I_soldier_F";
		_sniper = "I_Soldier_M_F";
		_sniper2 = _sniper;
	};
	// CUP
	case 1 : {
		_spotter = "CUP_O_TK_Spotter";
		_sniper = "CUP_O_TK_Sniper_KSVK";
		_sniper2 = "CUP_O_TK_Sniper";
	};
	// RHS
	case 2 : {
		_spotter = "rhsgref_ins_g_sniper";
		_sniper = "rhsgref_ins_g_spotter";
		_sniper2 = _sniper;
	};
};

for [{_i=1},{_i<=_number},{_i=_i+1}] do
{
	_pos = [_AOCenter, _maxDist, _minDist] call BIS_fnc_findOverwatch;

	_group = createGroup east;

	_unit = _group createUnit [_spotter, _pos, [], 0, "NONE"];

	if (random 1 > 0.5) then
	{
		_unit = _group createUnit [_sniper, _pos, [], 0, "NONE"];
	}
	else
	{
		_unit = _group createUnit [_sniper2, _pos, [], 0, "NONE"];
	};

	if (_missionType == 1) then
	{
		tf47_var_AOUnits pushBack _unit;
	};

	[_unit, [0.5,0.5,0.2,0.9,0.8,1,0.8,0.5,0.5,0.3]] call LV_ACskills;
};
