/*
*  return the list of handlers of mission in state new
*/
#include "AO_cfg.sqf"

private["_mainHandles","_completedMissions"];
_mainHandles = [];

{
	if (_x == TF47_MISSION_STATE_NEW) then {
		  _mainHandles pushBack _forEachIndex;
	};
}foreach tf47_supremacy_main_var_missionState;

_mainHandles;



