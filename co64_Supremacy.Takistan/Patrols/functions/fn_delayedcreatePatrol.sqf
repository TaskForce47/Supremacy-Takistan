/*
Author:

	Lucke

Last modified:

	12/03/2016

Description:



Notes:


______________________________________________*/
private[];
params[];

#define patrols
#include "..\..\config.hpp"

sleep ([patrols_respawn_min,patrols_respawn_max] call BIS_fnc_randomInt);
[] spawn tf47_fnc_createPatrol;
