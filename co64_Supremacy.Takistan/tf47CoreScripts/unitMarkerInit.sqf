/*
* Short Description
*
* init line:
* hNil = [this, "RAVEN-1", "b_air", WEST, "ColorBlue"] execVM "tf47CoreScripts\unitMarkerInit.sqf";
* param 0: unit to add marker to
* param 1: marker text
* param 2: marker icon
* param 3: side (optional, default: unit side)
* param 4: marker color (optional, default: side color)
* param 5: marker despawn time
*
* Tested with :
* Arma 3 1.23
*
* @category   Clienside Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @author     original script: http://forums.bistudio.com/showthread.php?111302-How-to-attach-a-marker-to-vehicle-then-fading-it-once-destroyed
* @website	  http://taskforce47.de/
* @version    1.0
*/

private ["_marker", "_unit", "_color"];

_unit = _this select 0;
_text = _this select 1;
_type = _this select 2;

// Get Side
_side = side _unit;
if (count _this > 3) then {
	_side = _this select 3;
};

// Make sure only the correct side sees the unit
if(!isServer) exitWith {};
// if (!isServer) then {
	// waitUntil {!isNull player};
// };
// if (isNull player) exitWith {};
// if (side player != _side) exitWith {};

// Set Color
if (count _this > 4) then {
	_color = _this select 4;
} else {
	_color = "ColorOPFOR";
	if (_side == WEST) then {
		_color = "ColorBLUFOR";
	};
	if (_side == RESISTANCE) then {
		_color =  "ColorIndependent";
	};
};
_markerdespawn = if (count _this > 5) then {_this select 5} else { 300 };

// Create the Marker
_marker = createMarker [format ["mrk%1%2%3", _text, _side, floor(random 1000000)], getPos _unit];
_marker setMarkerShape "ICON";
_marker setMarkerType _type;
_marker setMarkerText _text;
_marker setMarkerColor _color;

// Update Position
while {(alive _unit)} do
{
	_unitpos = getPos _unit;

	if (_text == " ") then {
		_marker setMarkerPos _unitpos;
		sleep 30;
	} else {
		_unitpos0 = (_unitpos select 0);
		_unitpos1 = (_unitpos select 1)+5;
		_unitpos2 = (_unitpos select 2);
		_marker setMarkerPos [_unitpos0, _unitpos1, _unitpos2];
		sleep 1;
	};
};

// Upon Destruction, blur Marker...
_marker setMarkerAlpha 0.3;

// ...and remove it after a few minutes
sleep _markerdespawn;
deleteMarker _marker;
