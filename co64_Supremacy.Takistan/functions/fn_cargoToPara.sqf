/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

>> Blubb sprach das Essen, und sprang aus dem Gesicht!
>> needs to be spawned (spleep)

parameter: []
------------------------------------------------------------------------------------
*/
_leader = _this select 0;
_heli = vehicle _leader;

_cargo = assignedCargo _heli;

{
	moveOut _x;
	unassignVehicle _x;
	sleep 1.5;
	_para = createVehicle ["NonSteerable_Parachute_F", position _x, [], random 360, 'NONE'];
	_para setPos (getPos _x);
	_x moveInDriver _para;
} forEach _cargo;