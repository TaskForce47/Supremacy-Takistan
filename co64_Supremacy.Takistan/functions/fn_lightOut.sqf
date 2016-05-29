/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

disables light sources (street lamps, etc.) at a certain location

parameter: [position (array), radius, damage value]
------------------------------------------------------------------------------------
*/

private ["_position","_radius","_value","_lamps","_types"];

params ["_position","_radius","_value"];

_types = ["Lamps_Base_F", "CUP_A2_lamp_street2_ep1", "CUP_A2_lamp_street1_ep1", "Land_LightHouse_F", "Land_PowerPoleWooden_L_F", "Land_LampStreet_F", "Land_LampHarbour_F", "Land_LampStreet_small_F"];

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
	_lamps = _position nearObjects [_types select _i, _radius];
	sleep 1;
	{_x setDamage _value} forEach _lamps;
};