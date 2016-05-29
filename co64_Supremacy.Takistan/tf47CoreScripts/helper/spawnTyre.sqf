// Get our curstom argument
_type = _this select 3;

// check if there isn't already a thing
_near = ((getMarkerPos "tyreSpawnMarker") nearObjects ["thingX", 3]);
if(count _near > 0) then {
	{
		deleteVehicle _x;
	} forEach _near;
};
// spawn the thing
_obj = _type createVehicle [0,0,1000];
_obj setDir 0;
_obj setPos (getMarkerPos "tyreSpawnMarker");
