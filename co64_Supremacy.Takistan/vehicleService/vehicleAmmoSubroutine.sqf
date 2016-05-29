_actionId = _this select 2;
_veh = (_this select 3) select 0;	

_drv = driver _veh;

if (_veh == _drv) then {
	_drv groupChat "Das kannst du nur in einem Fahrzeug machen - This can only be done inside a vehicle.";

} else { if (_veh getVariable ["vehServiceActive", false]) then {
	// already being serviced	
	_veh vehicleChat "Dieses Fahrzeug wird bereits gewartet - This Vehicle is already being serviced.";	
	
} else {	

	_veh setVariable ["vehServiceActive", true, true];
	_veh vehicleChat "Das Fahrzeug wird aufmunitioniert - This Vehicle is being rearmed...";

	_fuel = fuel _veh;
	_veh setFuel 0;
		
	_loadTime = 12;	
	if(!isMultiplayer) then {
		_loadTime = 2;		
	};
	
	[_veh] execVM "vehicleService\x_reload.sqf";
	
	{
		sleep _loadTime;
		_veh vehicleChat format["Das Fahrzeug wird aufmunitioniert - This Vehicle is being rearmed... (%1%2)", _x, "%"];
	} foreach [10,20,30,40,50,60,70,80,90];	
	
	sleep _loadTime;
	_veh vehicleChat format["Das Fahrzeug wird aufmunitioniert - This Vehicle is being rearmed... (%1%2)", 100, "%"];
	
	_veh setFuel _fuel;
	_loadoutname = _veh getVariable ["loadoutName", "Unknown Loadout"];

	_veh vehicleChat "Das Fahrzeug ist voll aufmunitioniert - The Vehicle is fully rearmed.";
	_veh setVariable ["vehServiceActive", false, true];
			
}; };