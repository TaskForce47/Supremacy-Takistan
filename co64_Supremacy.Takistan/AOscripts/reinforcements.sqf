// if(!isServer) exitwith {};
if(true) exitWith {};

trig_rt enablesimulationGlobal false;

_reinforcement = ["paradrop","touchdown","armored"] call BIS_fnc_selectRandom;

{
	if (!alive _x) then
	{
		deleteVehicle _x;
		tf47_var_AOUnits = tf47_var_AOUnits - [_x];
	};
} forEach tf47_var_AOUnits;

if (count tf47_var_AOUnits < tf47_param_mainEnemyCount) then
{

if ( _reinforcement == "paradrop") then 	{
nul = [helipad,2,true,false,3000,"random",true,250,50,6,0.5,200,true,false,true,true,radiotower,false,"default",nil,nil,nil,false] execVM "LV\heliParadrop.sqf";
};

if ( _reinforcement == "touchdown") then 	{
nul = [helipad,true,2,4,false,false,player,"random",3000,true,false,8,"default",[true,false,false,true],nil,nil,nil,false] execVM "LV\reinforcementChopper.sqf";
};

if ( _reinforcement == "armored") then
{
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
				["rhsgref_ins_g_bmp1",3],
				["rhsgref_ins_g_bmp1d",3],
				["rhsgref_ins_g_bmp1k",3],
				["rhsgref_ins_g_bmp1p",3],
				["rhsgref_ins_g_bmp2e",2],
				["rhsgref_ins_g_bmp2",2],
				["rhsgref_ins_g_bmp2d",2],
				["rhsgref_ins_g_bmp2k",2],
				["rhsgref_ins_g_zsu234",3],
				["rhsgref_ins_g_t72ba",3],
				["rhsgref_ins_g_t72bb",3],
				["rhsgref_ins_g_t72bc",3]
			];
		};
	};

	_roads = [];

	_pos = [0,0];

	while {([_pos] call tf47_fnc_nearPlayerDist < 1500) || (_pos distance (getMarkerPos "base_spawn_1") < 1500) || (_pos isEqualTo [0,0])} do
	{
		while {count _roads < 2} do
		{
			_r = 2000 + random 1500;
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

		_wp = _group addWaypoint [getMarkerPos "ao_mkr1", 1];
		[_group, 0] setWaypointType "MOVE";
		[_group, 0] setWaypointBehaviour "SAFE";
		[_group, 0] setWaypointFormation "COLUMN";
		[_group, 0] setWaypointCompletionRadius (200 + random 750);
		[_group, 0] setWaypointSpeed "NORMAL";

		_wp = _group addWaypoint [getMarkerPos "ao_mkr1", 2];
		[_group, 1] setWaypointType "MOVE";
		[_group, 1] setWaypointBehaviour "SAFE";
		[_group, 1] setWaypointCompletionRadius (random 200);
		[_group, 1] setWaypointSpeed "NORMAL";

		sleep 5;
	};
};

};

sleep (200 + (random 300));
trig_rt enablesimulationGlobal true;