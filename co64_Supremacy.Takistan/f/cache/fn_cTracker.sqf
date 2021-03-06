// F3 - Caching Script Tracker
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_range","_groups","_debug","_message","_file"];
//Filename
_file = "fn_cTracker.sqf";

_range = _this select 0;
_groups = allGroups;

_debug = if (f_var_debugMode > 1) then [{true},{false}];

// ====================================================================================

// BEGIN THE TRACKING LOOP
While {f_var_cacheRun} do {
        {       
                _file = "fn_cTracker.sqf";
                _groups = allGroups;

                if (_debug) then{
                        _message =  format ["f_fnc_cache DBG: Tracking %1 groups",count _groups];
                        [_message,_file] call TF47_Helper_fnc_debugCase;
                };

                if (isnull _x) then {
                        _groups = _groups - [_x];

                        if (_debug) then{
                                _message =  format ["f_fnc_cache DBG: Group is null, deleting: %1",_x,count _groups];
                                [_message,_file] call TF47_Helper_fnc_debugCase;
                        };

                } else {
                        _exclude = _x getvariable ["f_cacheExcl",false];
                        _cached = _x getvariable ["f_cached", false];

                        if (!_exclude) then {
                                if (_cached) then {

                                        if (_debug) then {
                                                _message =  format ["f_fnc_cache DBG: Checking group: %1",_x];
                                                [_message,_file] call TF47_Helper_fnc_debugCase;
                                        };

                                        if ([leader _x, _range] call f_fnc_nearPlayer) then {

                                                if (_debug) then {
                                                        _message =  format ["f_fnc_cache DBG: Decaching: %1",_x];
                                                        [_message,_file] call TF47_Helper_fnc_debugCase;
                                                        };

                                                _x setvariable ["f_cached", false];
                                                _x spawn f_fnc_gUncache;

                                        };
                                } else {
                                        if !([leader _x, _range * 1.1] call f_fnc_nearPlayer) then {

                                                if (_debug) then {
                                                        _message = format ["f_fnc_cache DBG: Caching: %1",_x];
                                                        [_message,_file] call TF47_Helper_fnc_debugCase;
                                                };

                                                _x setvariable ["f_cached", true];
                                                [_x] spawn f_fnc_gCache;
                                        };
                                };

                                if (_debug) then { 
                                        _message = format ["f_fnc_cache DBG: Group is excluded: %1",_x];
                                        [_message,_file] call TF47_Helper_fnc_debugCase;
                                };
                        };
                };
        } foreach _groups;

        sleep f_var_cacheSleep;
};

// If the caching loop is terminated, uncache all cached groups
{
        if (_x getvariable ["f_cached", false]) then {
                _x spawn f_fnc_gUncache;
                _x setvariable ["f_cached", false];
        };
} forEach allGroups;