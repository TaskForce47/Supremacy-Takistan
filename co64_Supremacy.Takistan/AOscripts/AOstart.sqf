AOCount = 0;
publicVariable "AOCount";

sleep 25;

// ======================== random Domination Start ===================================


_domistart = ["NE","NW","SE","SW"] call BIS_fnc_selectRandom;


[] execVM "AOscripts\militarizeAO.sqf";