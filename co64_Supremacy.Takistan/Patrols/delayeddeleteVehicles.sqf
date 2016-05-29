/*
Author: 

	Lucke

Last modified: 

	12/03/2016

Description:

	[[<objects>],<delay>] execVM "Patrols\functions\fn_delayeddeleteVehicles.sqf";
	
Notes:
	
	
______________________________________________*/
private["_objects","_delay"];
params[["_objects",[]],["_delay",300]];

sleep _delay;
{
	if !(_x == objNull) then {
		deleteVehicle _x;
	};
} forEach _objects;