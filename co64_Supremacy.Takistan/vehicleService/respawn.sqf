
_veh = _this select 0;


_veh setVariable ["vehServiceActive", true, true];
_veh setVariable ["debugRespawn", true, true];

// Pull out Units, remove Fuel and lock Vehicle
_veh vehicleChat "Das Fahrzeug wird in 5 Minuten respawnen - This Vehicle will respawn in 5 Minutes.";
sleep 5;

_crw = crew _veh;
{
	_crwman = _x;
	unAssignVehicle _crwman;
	_crwman action ["getOut", _veh];
} forEach _crw;

_veh lock true;

_veh vehicleChat "Bitte das Fahrzeug verlassen. - Please leave the Vehicle.";
sleep 5;
_veh setFuel 0;

// Initiate Respawn
sleep 5;
_veh setPos[0,0,0];
sleep 1;
_veh setDamage 1;