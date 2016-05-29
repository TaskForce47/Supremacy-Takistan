/*
Author:

	Lucke

Last modified:

	12/03/2016

Description:

	[] call tf47_fnc_checkPatrols;

Notes:


______________________________________________*/
//_typ
//_Patrol_Type = {inf,wheeld,tracked} 
//psydo enum: PATROL_TYPE
#define PATROLS_TYPE 0
#define PATROLS_TYPE_INFANTRY 0
#define PATROLS_TYPE_WHEELD   1
#define PATROLS_TYPE_TRACKED  2

#define PATROLS_TIMER 1
//_group
#define PATROLS_GROUPHANDLE 2
//_convoy
#define PATROLS_LIST_OF_CONVOY_VEHICLES 3
//_inf 
#define PATROLS_LIST_OF_CONVOY_INFANTRY_UNITS 4
//_start
#define PATROLS_START_MARKER 5
//_end
#define PATROLS_END_MARKER 6

// check for every patrol
{   
	// clean up patrols
    [(_x select PATROLS_LIST_OF_CONVOY_INFANTRY_UNITS) -  units (_x select PATROLS_GROUPHANDLE), 300] execVM "Patrols\delayeddeleteVehicles.sqf";
    _respawn = true;
    {
        if !(alive _x) then {
            [[_x], 300] execVM "Patrols\delayeddeleteVehicles.sqf";
        };
    } forEach units (_x select PATROLS_GROUPHANDLE) + (_x select PATROLS_LIST_OF_CONVOY_VEHICLES);
    {
        if (speed _x < 3) then {
            sleep 10;
            if (speed _x < 3) then {
                [(crew _x) + [_x], 0] execVM "Patrols\delayeddeleteVehicles.sqf";
            };
        };
    } forEach (_x select PATROLS_LIST_OF_CONVOY_VEHICLES);

    {
        if !(isNull _x) then {
            _respawn = false;
        };
    } forEach (_x select PATROLS_LIST_OF_CONVOY_VEHICLES);

    if (_respawn) then {
        [(_x select PATROLS_LIST_OF_CONVOY_INFANTRY_UNITS) + (_x select PATROLS_LIST_OF_CONVOY_VEHICLES), 3] execVM "Patrols\delayeddeleteVehicles.sqf";
        PatrolMarkers = PatrolMarkers + [_x select PATROLS_START_MARKER, _x select PATROLS_END_MARKER];
        Patrols = Patrols - [_x];
        [_x select PATROLS_TYPE, _x select PATROLS_TIMER] execVM "Patrols\delayedcreatePatrol.sqf";
    };
} forEach Patrols;
