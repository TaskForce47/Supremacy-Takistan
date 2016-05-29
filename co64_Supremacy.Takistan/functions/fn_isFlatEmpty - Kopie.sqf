/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

finds out if given rectangle is free of objects and flat

parameter: [position (array), direction, width, height, gradient, blacklist (array)]
------------------------------------------------------------------------------------
*/

private ["_position","_direction","_dir","_angle","_gradient","_blacklist","_h0","_h1","_h2","_h3","_h4","_output","_posX","_dir","_size","_radius","_hy","_angle","_dirNew","_posNew"];

params ["_position", "_direction", "_height", "_width", "_gradient", "_blacklist"];

_radius = sqrt(_width^2 + _height^2);

_nearObjects = _position nearObjects _radius;

_output = 1;

{
	_posX = getPos _x;
	_dir = [_x, _position] call BIS_fnc_DirTo;
	_size = sizeOf (typeOf _x);
	_hy = (getPos _x) distance2D _position;
	_angle = asin(((_position select 0) - (_posX select 0)) / _hy);
	_dirNew = -_angle + (-_direction-90);
	_posNew = [(_position select 0) + cos(_dirNew)*(_hy-_size),(_position select 1) + sin(_dirNew)*(_hy-_size)];

	if ((abs ((_posNew select 0)-(_position select 0)) < _width/2) && (abs ((_posNew select 1)-(_position select 1)) < _height/2) && (_size > 1) && !(_x in _blacklist) && !(_x isKindOf "men") && !(_x isKindOf "Insect")) exitWith {_output = 0;};
} forEach _nearObjects;

_h0 = getTerrainHeightASL _position;
_h1 = getTerrainHeightASL [(_position select 0) + _width*sin(_direction)/2,(_position select 1) + _width*cos(_direction)/2];
_h2 = getTerrainHeightASL [(_position select 0) + _height*sin(_direction+90)/2,(_position select 1) + _height*cos(_direction+90)/2];
_h3 = getTerrainHeightASL [(_position select 0) - _width*sin(_direction)/2,(_position select 1) - _width*cos(_direction)/2];
_h4 = getTerrainHeightASL [(_position select 0) - _height*sin(_direction+90)/2,(_position select 1) - _height*cos(_direction+90)/2];

_avg = (_h0+_h1+_h2+_h3+_h4)/5;

if (abs(_h0-_avg) + abs(_h1-_avg) + abs(_h2-_avg) + abs(_h3-_avg) + abs(_h4-_avg) > _gradient) then {_output = 0;};

_output