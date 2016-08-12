/*
*  return the list of handlers of the active main missions
*/
#include "AO_cfg.sqf"

private["_mainPositions","_mainHandles"];
_mainHandles = [];

{
	if (_x == TF47_MISSION_STATE_ACTIVE) then {
		  _mainHandles pushBack _forEachIndex;
	};
}foreach tf47_supremacy_main_var_missionState ;

_mainHandles;