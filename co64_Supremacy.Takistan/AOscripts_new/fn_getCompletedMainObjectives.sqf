/*
*  return the list of handlers of the completed main missions
*/
#include "AO_cfg.sqf"

private["_mainPositions"];
_mainHandles = []:

{
	if ((_x == TF47_MISSION_STATE_SUCCESSFUL) || (_x == TF47_MISSION_STATE_FAILED)) then {
		  _mainHandles pushBack _forEachIndex;
	};
}foreach tf47_supremacy_main_var_missionState;

_mainHandles;