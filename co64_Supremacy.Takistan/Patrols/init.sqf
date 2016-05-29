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
private ["_amount","_typs","_temp"];
params [["_amount", 10],["_typs",[["inf", 1, 600],["wheeld", 2, 1200],["tracked", 4, 1800]]]];

Patrols = [];
PatrolMarkers = [] call tf47_fnc_getPatrolMarkers;

while {_amount != 0 AND (count Patrols) != 5} do {
	_temp = _typs call BIS_fnc_selectRandom;
	if (_temp select 1 <= _amount) then {
	  	_amount = _amount - (_temp select 1);
	  	[_temp select 0, _temp select 2] execVM "Patrols\delayedcreatePatrol.sqf";
	};	  	
};


while {true} do {
	sleep 300;
	[] execVM "Patrols\checkPatrols.sqf"; 
};