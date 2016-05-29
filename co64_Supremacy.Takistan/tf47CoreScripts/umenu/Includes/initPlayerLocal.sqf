sleep 1;
if (isNil "TF47_UMenu_isEnabled") then {TF47_UMenu_isEnabled = false;};
	
if ((player == (_this select 0)) && TF47_UMenu_isEnabled) then {
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_null = [_this] call tf47_core_umenu_fnc_keyDown;"];
};