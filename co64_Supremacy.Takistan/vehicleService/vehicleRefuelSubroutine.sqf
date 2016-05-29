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
	_veh vehicleChat "Das Fahrzeug wird betankt - This Vehicle is being refuelled...";

	_fuel = fuel _veh;
	_veh setFuel 0;

	_refuelTime = 30 * (1 - _fuel);

	if(!isMultiplayer) then {
		_refuelTime = _refuelTime / 10;
	};

	// Initiate Refuelling

	{
		sleep _refuelTime;	
		_veh vehicleChat format["Das Fahrzeug wird betankt - This Vehicle is being refuelled... (%1%2)", _x, "%"];
	} forEach [10,20,30,40,50,60,70,80,90];

	sleep _refuelTime;	
	_veh vehicleChat format["Das Fahrzeug wird betankt - This Vehicle is being refuelled... (%1%2)", 100, "%"];
	_veh setFuel 1;

	_veh vehicleChat "Betankung vollstaendig abgeschlossen! - Refuelling done!";
	_veh setVariable ["vehServiceActive", false, true];
			
}; };