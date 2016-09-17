_actionId = _this select 2;
_veh = (_this select 3) select 0;	

_drv = driver _veh;

diag_log format["DRV: %1", _drv];
diag_log format["VEH: %1", _veh];
	
if (_veh == _drv) then {
	_drv groupChat "Das kannst du nur in einem Fahrzeug machen - This can only be done inside a vehicle.";

} else { if (_veh getVariable ["vehServiceActive", false]) then {
	// already being serviced	
	_veh vehicleChat "Dieses Fahrzeug wird bereits gewartet - This Vehicle is already being serviced.";	
	
} else {		

	// Make sure _veh is not damaged
	_dmg = getDammage _veh;

	if (_dmg > 0.1) then {
		_veh vehicleChat "Das Fahrzeug kann nicht respawnen da es beschädigt ist - This Vehicle can't respawn because it is damaged.";

		} else {
			[_veh, "respawn.sqf", 2] call BIS_fnc_MP;
		};
				
	};
};