/*
Author:

	Lucke

Last modified:

	23/02/2016

Description:

	[] execVM "Patrols\init.sqf";

Notes:


______________________________________________*/

if(!([] call TF47_Helper_fnc_checkForHc)) exitwith {};

private ["_amount"];
params [];

Patrols = [];
PatrolMarkers = [] call tf47_fnc_getPatrolMarkers;

for "_amount" from 0 to ([3,7] call BIS_fnc_randomInt) do {
	[] execVM "Patrols\scripts\delayedcreatePatrol.sqf";
};

[{[] spawn tf47_fnc_checkPatrol;},30,[]] call CBA_fnc_addPerFrameHandler
