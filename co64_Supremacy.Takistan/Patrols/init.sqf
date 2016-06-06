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

#define patrols
#include "..\config.hpp"

Patrols = [];
PatrolMarkers = [] call tf47_fnc_getPatrolMarkers;

for "_amount" from 0 to ([patrols_amount_min, patrols_amount_max] call BIS_fnc_randomInt) do {
	[] spawn tf47_fnc_delayedcreatePatrol;
};

[{[] spawn tf47_fnc_checkPatrol;},patrols_check_timer,[]] call CBA_fnc_addPerFrameHandler
