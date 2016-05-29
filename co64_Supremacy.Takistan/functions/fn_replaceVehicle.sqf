private ["_pos","_dir","_vehiclestring","_veh"];
params ["_pos","_dir","_vehiclestring"];
_veh = createVehicle [_vehiclestring, _pos, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;
_veh