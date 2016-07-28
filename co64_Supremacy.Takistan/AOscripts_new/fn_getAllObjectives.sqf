/*
*  return the list of handlers of all  main missions (active, inactive, completed,..)
*/
#include "AO_cfg.sqf"

private["_mainPositions","_mainHandles"];
_mainHandles = []:

{
	_mainHandles pushBack _forEachIndex;
}foreach tf47_supremacy_main_var_AOCollection;

_mainHandles;