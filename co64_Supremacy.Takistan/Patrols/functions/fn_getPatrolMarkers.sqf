/*
Author: 

	Lucke

Last modified: 

	23/02/2016

Description:

	[] call tf47_fnc_getPatrolMarkers;
	
Notes:
	
	
______________________________________________*/
private["_i","_PatrolMarkers"];

_PatrolMarkers = [];
_i = 1;

while {getMarkerPos format["patrolpoint_%1", _i] select 0 != 0} do {
	_PatrolMarkers = _PatrolMarkers + [format["patrolpoint_%1", _i]];
	_i = _i + 1;
};

_PatrolMarkers