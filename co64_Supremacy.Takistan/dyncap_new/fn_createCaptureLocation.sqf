if(!([] call TF47_Helper_fnc_checkForHc)) exitwith {};

_location = param[0,[0,0,0]];
_captureRadius =param[1,0]; 
_buildingType = param[2,"Land_fortified_nest_big_EP1"];
_captureTime = param[3,0];
_side = param[4, OPFOR]; 
_bunkerMarker = param[5,""];
_missionHandle = param[6,0];


_marker = createMarker [_bunkerMarker, _location];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_objective";
_marker setMarkerSize [0.50, 0.50];
_marker setMarkerColor "ColorRed";

(tf47_supremacy_main_var_Marker select _missionHandle) pushBack _marker;

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
[_captureBuilding, _captureRadius, _captureTime] spawn tf47_dyncap_fnc_serverCaptureMonitor;

// spawn client threads
//[[[_captureBuilding,_captureRadius,_captureTime],"dyncap\dynClientCaptureMonitor.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
[_captureBuilding,_captureRadius,_captureTime] remoteExec  ["tf47_dyncap_fnc_clientCaptureMonitor",-2,true];

_captureBuilding