if(!([1] call TF47_Helper_fnc_checkForHc)) exitwith {};

[] call compileFinal preprocessFileLineNumbers "dyncap\dyncap_fn.sqf";

_location = _this select 0;
_captureRadius = _this select 1;
_buildingType = _this select 2;
_captureTime = _this select 3;
_side = _this select 4;


_marker = createMarker ["BunkerMarker3", _location];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_objective";
_marker setMarkerSize [0.50, 0.50];
_marker setMarkerColor "ColorRed";

_dir = getDir (nearestBuilding _location);

_captureBuilding = _buildingType createVehicle _location;
waitUntil {alive _captureBuilding};

_captureBuilding setDir _dir;

_captureBuilding setVehiclePosition [_location, [], 0, "NONE"];

_captureBuilding allowDamage false;
_captureBuilding setVariable ["isBeingCaptured", false, true];
_captureBuilding setVariable ["owner", _side, true];
_captureBuilding setVariable ["marker", _marker, true];


// spawn server thread
[_captureBuilding, _captureRadius, _captureTime] execVM "dyncap\dynServerCaptureMonitor.sqf";

// spawn client threads
[[[_captureBuilding,_captureRadius,_captureTime],"dyncap\dynClientCaptureMonitor.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;

_captureBuilding