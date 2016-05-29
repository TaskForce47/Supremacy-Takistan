/****************************************
*****************************************

Module: Cleanup
Global-var-shortcut: pvpfw_cleanup_
Author: Fred TF47

You can "setVariable["pvpfw_cleanUp_keep",true]" on any object, to exempt it from the cleanup

*****************************************
****************************************/

private[
	"_unit",
    "_keep"
];

if(!isServer) exitWith{};

_unit = param [0, objNull];

#include "cleanup_config.sqf"

_nearEntities = [];
//TRACE_1("Start cleanup logic for",_unit);


if (isNull _unit) exitWith {
    diag_log format["PVPFW module_cleanup: expexted parameter not give"];
};


while {true} do{

	diag_log format["PVPFW module_cleanup: Start cleanup logic"];
	_keep = _unit getVariable["pvpfw_cleanUp_keep",false];

    if (_keep) exitwith {
        //TRACE_1("prevent from cleaning, exit",_unit);
        diag_log format["PVPFW module_cleanup: prevent from cleaning, exit"];
    };

    if (!(_unit isKindOf "CAManBase")) exitwith{
         //ERROR("Unit is not typ of CAManBAse");
     //    diag_log format["PVPFW module_cleanup: Unit is not typ of CAManBAse"];       
    };

	_cleanUpInitTime = _unit getVariable ["pvpfw_cleanup_InitTime",0];
	if (_cleanUpInitTime == 0) then{
		_cleanUpInitTime = diag_tickTime;
		_unit setVariable ["pvpfw_cleanup_InitTime",_cleanUpInitTime,false];
	};

	//delete the body if the time limit has been reached
	if (diag_tickTime > (_cleanUpInitTime + pvpfw_cleanUp_bodyTimer)) exitwith{
		// Hide and remove the body from the game
		hideBody _unit;
		sleep 5; 
		_unit setVariable ["pvpfw_cleanup_InitTime",0,false];
		deleteVehicle _unit;
	//	diag_log format["#PVPFW module_cleanup: deleting player body. init = %1, current time = %2",_cleanUpInitTime,diag_tickTime];               
	};
    sleep 10;
};
