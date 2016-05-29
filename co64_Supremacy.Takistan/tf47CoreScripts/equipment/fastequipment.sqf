private ["_loadout"];

["GEAR",["Your Standard gear was selected"]] call BIS_fnc_showNotification;


_loadout = (player getVariable "f_var_assignGear");
[_loadout,player] call f_fnc_assignGear;
