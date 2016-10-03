
_veh = _this select 0;

sleep 5;

diag_log str _veh;

diag_log "--------------- dasdasd --------------------";


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