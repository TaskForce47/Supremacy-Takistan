_thislist = _this select 0;
waitUntil{!isNull player};
{
	["JIP",["Your standard Gear was selected."]] call BIS_fnc_showNotification;

	_loadout = (player getVariable "f_var_assignGear");
	[_loadout,player] call f_fnc_assignGear;
	[] execVM "f\radios\radio_init.sqf";

} forEach _thislist;