/*
	complete started mission
	can be called from every position, but must be running on server.
	be aware the mission initialiation shoub be completed

	@todo: synchronisation with mission creation. Creation should be completed before this script can start. 

*/
#include "AO_cfg.sqf"

private["_AONumber"];

_AONumber = param[0,0];
diag_log format ["Mission clean up start: %1", (tf47_supremacy_main_var_AOCollection select _AONumber) select 1];

if(!([] call TF47_Helper_fnc_checkForHc)) exitwith {};

if (tf47_supremacy_main_var_missionCreationOngoing select _AONumber) exitWith{
	diag_log format["fn_completeMainObjective: Mission creation in ongoing, exit"];
};

if !((tf47_supremacy_main_var_missionState select _AONumber) == TF47_MISSION_STATE_ACTIVE) exitWith{
	diag_log format["fn_completeMainObjective: Mission not active, exit"];
};

if !(isNull (tf47_supremacy_main_var_trigger select _AONumber)) then {
	deletevehicle (tf47_supremacy_main_var_trigger select _AONumber);
};
sleep 0.1;

if (!isNull (tf47_supremacy_main_var_HeliPad select _AONumber)) then {
	deleteVehicle (tf47_supremacy_main_var_HeliPad select _AONumber);
};
sleep 0.1;

if (!isNull (tf47_supremacy_main_var_radiotowers select _AONumber)) then {
	deleteVehicle (tf47_supremacy_main_var_radiotowers select _AONumber);
};
sleep 0.1;
{
	nul = [_x] execVM "LV\LV_functions\LV_fnc_removeGroupV2.sqf";
	deleteGroup _x;
} forEach (tf47_supremacy_main_var_AOGroups select _AONumber);
tf47_supremacy_main_var_AOGroups set [_AONumber,[]];


{
	if !(isNull _x) then {
		deleteVehicle _x;		
		sleep 0.1;
	};
} forEach (tf47_supremacy_main_var_AOObjects select _AONumber);
tf47_supremacy_main_var_AOObjects set [_AONumber,[]];

{
	if !(isNull _x) then {
		deleteVehicle _x;
		sleep 0.1;
	}
} forEach (tf47_supremacy_main_var_AOUnits select _AONumber);
tf47_supremacy_main_var_AOUnits set [_AONumber,[]];

{
	deleteMarker _x;
	sleep 0.1;
	//@todo check marker exists
} forEach	(tf47_supremacy_main_var_Marker select _AONumber);
tf47_supremacy_main_var_Marker set [_AONumber,[]];
tf47_supremacy_main_var_missionState set  [_AONumber,TF47_MISSION_STATE_SUCCESSFUL];
[(tf47_supremacy_main_var_Tasks select _AONumber), "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
tf47_supremacy_main_var_mainCount = tf47_supremacy_main_var_mainCount +1;

diag_log format ["Mission clean up: %1", (tf47_supremacy_main_var_AOCollection select _AONumber) select 1];
 