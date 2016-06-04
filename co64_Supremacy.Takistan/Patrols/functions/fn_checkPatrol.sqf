/*
Author:

	Lucke

Last modified:

	12/03/2016

Description:

	[] call tf47_fnc_checkPatrols;

Notes:


______________________________________________*/
//[_group, _convoy,  _start, _end]
//_group
#define PATROLS_GROUPHANDLE select 0
//_convoy
#define PATROLS_LIST_OF_CONVOY_VEHICLES select 1
//_start
#define PATROLS_START_MARKER select 2
//_end
#define PATROLS_END_MARKER select 3

// check for every patrol
{
  if !(count ([_x PATROLS_GROUPHANDLE ,allGroups,1000,{(side _x == west)}] call CBA_fnc_getNearest) > 0) then {
    _respawn = true;
    if ((currentWaypoint (_x PATROLS_GROUPHANDLE)) == 2) then {
      [_x PATROLS_GROUPHANDLE] call CBA_fnc_deleteEntity;
      [_x PATROLS_LIST_OF_CONVOY_VEHICLES] call CBA_fnc_deleteEntity;
      Patrols deleteAt _forEachIndex;
      [] execVM "\Patrols\scripts\delayedcreatePatrol.sqf";
    } else {
      {
        if ((speed _x) < 3) then {
            sleep 5;
            if ((speed _x) < 3) then {
                [fullCrew _x,_x] call CBA_fnc_deleteEntity;
            };
        };
      } forEach (_x PATROLS_LIST_OF_CONVOY_VEHICLES);

      {
        if ((vehicle _x) == _x) then {
             [_x] call CBA_fnc_deleteEntity;
        };
      } forEach (units (_x PATROLS_GROUPHANDLE));

      if (!([_x PATROLS_GROUPHANDLE] call CBA_fnc_isAlive) || !([_x PATROLS_LIST_OF_CONVOY_VEHICLES] call CBA_fnc_isAlive)) then {
        [_x PATROLS_GROUPHANDLE] call CBA_fnc_deleteEntity;
        [_x PATROLS_LIST_OF_CONVOY_VEHICLES] call CBA_fnc_deleteEntity;
        Patrols deleteAt _forEachIndex;
        [] execVM "\Patrols\scripts\delayedcreatePatrol.sqf";
      };
    };
  };
} forEach Patrols;
