/*
*  return the radius of the given main objective handle, return 0 if handle is not valid
*/

#include "AO_cfg.sqf";

private ["_mainHandle","_mainRadius"];

_mainHandle = param [0,0,[Number]];

if (_mainHandle < count tf47_supremacy_main_var_AOCollection) then
{
	_mainRadius  = ((tf47_supremacy_main_var_AOCollection select _mainHandle) select TF47_SUPREMACY_MAIN_AOCOLLECTION_SELECT_RADIUS);
} else {
	_mainRadius = 0;
};

_mainRadius;