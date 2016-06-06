/*
Author:

	Lucke

Last modified:

	23/02/2016

Description:

	[_temp select 0, _temp select 2] call tf47_fnc_createPatrol;

Notes:


______________________________________________*/
private["_start","_end","_startpos","_endpos","_convoy","_startdir","_group","_temp"];
params[];

#define patrols
#include "..\..\config.hpp"

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

for "_i" from 0 to ([patrols_vehicles_min,patrols_vehicles_max] call BIS_fnc_randomInt) do {
	_convoy pushBack (createVehicle[(patrols_vehicles call BIS_fnc_selectRandom),_startpos,[],0,"CAN_COLLIDE"]);
	_startpos = _startpos getPos[10, _startdir + 180];
};

{
	_x setDir _startdir;
	createVehicleCrew _x;
	crew _x join _group;

	for "_i" from 0 to ([0, (_x emptyPositions "Cargo")] call BIS_fnc_randomInt) do {
		_temp = _group createUnit [(patrols_infantry call BIS_fnc_selectRandom), [0,0,0],[],0,"NONE"];
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
