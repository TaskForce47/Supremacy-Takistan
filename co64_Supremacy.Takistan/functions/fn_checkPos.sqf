/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

finds out if given rectangle is free of objects and flat

parameter: [position (array), radius, gradient]
------------------------------------------------------------------------------------
*/

private ["_position","_rad","_gradient","_h0","_h1","_h2","_h3","_h4","_output","_posX","_dir","_size","_radius","_hy","_angle","_dirNew","_posNew"];

params ["_position", "_rad", "_gradient"];

_nearObjects = _position nearObjects _rad + 4;

_output = 1;

if (surfaceIsWater _position) then
{
	_output = 0;
};

{
	if (!(_x isKindOf "men") && !(_x isKindOf "Insect")) exitWith {_output = 0;};
} forEach _nearObjects;

_p0 = _position;
_p1 = [(_position select 0) + _rad,(_position select 1) + _rad];
_p2 = [(_position select 0) + _rad,(_position select 1) - _rad];
_p3 = [(_position select 0) - _rad,(_position select 1) - _rad];
_p4 = [(_position select 0) - _rad,(_position select 1) + _rad];

if (isOnRoad _p0) exitWith {_output = 0; 0;};
if (isOnRoad _p1) exitWith {_output = 0; 0;};
if (isOnRoad _p2) exitWith {_output = 0; 0;};
if (isOnRoad _p3) exitWith {_output = 0; 0;};
if (isOnRoad _p4) exitWith {_output = 0; 0;};

_h0 = getTerrainHeightASL _p0;
_h1 = getTerrainHeightASL _p1;
_h2 = getTerrainHeightASL _p2;
_h3 = getTerrainHeightASL _p3;
_h4 = getTerrainHeightASL _p4;

_avg = (_h0+_h1+_h2+_h3+_h4)/5;

_p1 = [(_position select 0) + _rad,(_position select 1) + _rad, _h1 + 0.5];
_p2 = [(_position select 0) + _rad,(_position select 1) - _rad, _h2 + 0.5];
_p3 = [(_position select 0) - _rad,(_position select 1) - _rad, _h3 + 0.5];
_p4 = [(_position select 0) - _rad,(_position select 1) + _rad, _h4 + 0.5];

if (count (lineIntersectsWith [_p1, _p2]) > 0 ) exitWith {_output = 0; 0;};
if (count (lineIntersectsWith [_p2, _p3]) > 0 ) exitWith {_output = 0; 0;};
if (count (lineIntersectsWith [_p3, _p4]) > 0 ) exitWith {_output = 0; 0;};
if (count (lineIntersectsWith [_p4, _p1]) > 0 ) exitWith {_output = 0; 0;};

if (abs(_h0-_avg) + abs(_h1-_avg) + abs(_h2-_avg) + abs(_h3-_avg) + abs(_h4-_avg) > _gradient) then {_output = 0;};

_output