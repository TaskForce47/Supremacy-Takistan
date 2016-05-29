/****************************************
*****************************************

Module: Cleanup
Global-var-shortcut: pvpfw_cleanup_
Author: Conroy,  exteded by Fred TF47

You can "setVariable["pvpfw_cleanUp_keep",true]" on any object, to exempt it from the cleanup

*****************************************
****************************************/

private[
	"_nearEntities",
	"_ruinsCheck",
	"_delay",
	"_type",
	"_cleanUpInitTime",
	"_numberOfPlayerNearby",
	"_checkTypes",
	"_chemLightObjects",
	"_chemLightTime",
	"_pipeBombObjects",
	"_pipeBombTime",
	"_chemLightSetTime",
	"_pipeBombSetTime"
];

if(!isServer) exitWith{};

#include "cleanup_config.sqf"

if (pvpfw_cleanup_cleanAbandonded) then{
	[] execVM TF47_fnc_cleanup_Abandonded; //starts the module to automatically clean up abandonded (empty) vehicles
};

_nearEntities = [];

#ifdef __pvpfw_cleanUp_cleanExtra
_checkTypes = "";
#else
_checkTypes = "All";
#endif

_chemLightObjects = [];
_chemLightTime = [];

_pipeBombObjects = [];
_pipeBombTime = [];

diag_log format["#PVPFW add event handler for killed player"];
/************** register some events *************/

["TF47_cleanup_ev_registerDeadPlayerBody", {
   private ["_playerBody"];
	_playerBody = param [0, objNull];
	[_playerBody] spawn TF47_fnc_cleanup_unitKillHandler;		
}] call CBA_fnc_addEventHandler;


pvpfw_cleanup_run = 1;
waituntil{	
	diag_log format["#PVPFW next Clean up run"];
	{
		_delay = 0.02;
		_type = typeOf _x;
		 //diag_log format["#PVPF analyze Type Clean up run %1", _type];
		if (!isNull _x) then{
			switch(true)do{
				case(_x getVariable["pvpfw_cleanUp_keep",false]):{
					_delay = 0.01;
					//diag_log format["#PVPFW The objects variable indicates, that it should not be cleaned up %1", _type];					
				};
			
				#ifdef __pvpfw_cleanUp_cleanExtra
				case(_type == ""):{
					_delay = 0.01;
					// Many objects in the mission will return an empty string as their type. We just skip them immediately.
				};
				#endif
				
				case(!alive _x):{
					_delay = 0.05;					
					diag_log format["#PVPFW found dead object %1",_x];
									
					if ((([ getPosATL _x ] call tf47_fnc_nearPlayerDist) > pvpfw_cleanUp_vehicleRadius) || (((getMarkerPos "cleanup_base") distance (getPosATL _x)) < pvpfw_cleanUp_baseRadius))  then{
						if (_x isKindOf "CAManBase") then{
							_cleanUpInitTime = _x getVariable ["pvpfw_cleanup_InitTime",0];
							if (_cleanUpInitTime == 0) then{
								_cleanUpInitTime = diag_tickTime;
								_x setVariable ["pvpfw_cleanup_InitTime",_cleanUpInitTime,false];
							};
							//delete the body if the time limit has been reached
							if (diag_tickTime > (_cleanUpInitTime + pvpfw_cleanUp_bodyTimer)) then{
								deleteVehicle _x;
								diag_log format["#PVPFW module_cleanup: deleting body. init = %1, current time = %2",_cleanUpInitTime,diag_tickTime];
							};
						}else{
							// wreck?   
							_cleanupInitTime = _x getVariable["pvpfw_cleanup_InitTime",0];
							if (_cleanupInitTime == 0) then{
								_x setVariable ["pvpfw_cleanup_InitTime",diag_tickTime,false];
							}else{
								if (diag_tickTime > (_cleanupInitTime + pvpfw_cleanUp_vehicleTimer)) then{
									deleteVehicle _x;
									diag_log format["#PVPFW module_cleanup: deleting vehicle. init = %1, current time = %2",_cleanUpInitTime,diag_tickTime];
								};
							};
						};
					}else{
						_x setVariable ["pvpfw_cleanup_InitTime",0,false];
                    };
				};
				
								
				case(_type in ["GroundWeaponHolder","WeaponHolderSimulated","ACE_bodyBagObject"]):{
						diag_log format["#PVPFW found %1 name: %2 ",_x, _type];
						_delay = 0.05;
					if (
					      (([getPosATL _x] call tf47_fnc_nearPlayerDist) > pvpfw_cleanUp_weaponHolderRadius) || 
					      (((getMarkerPos "cleanup_base") distance (getPosATL _x)) < pvpfw_cleanUp_baseRadius)
					   ) then{
						_cleanupInitTime = _x getVariable["pvpfw_cleanup_InitTime",0];
						
						if (_cleanupInitTime == 0) then{
							_x setVariable ["pvpfw_cleanup_InitTime",diag_tickTime,false];
						}else{
							if (diag_tickTime > (_cleanupInitTime + pvpfw_cleanUp_weaponHolderTimer)) then{
								deleteVehicle _x;
								diag_log format["#PVPFW module_cleanup: deleting GroundWeaponHolder. init = %1, current time = %2",_cleanUpInitTime,diag_tickTime];
							};
						};
					}else{
						_x setVariable ["pvpfw_cleanup_InitTime",0,false];
					};
				};
				
				
				#ifdef __pvpfw_cleanUp_cleanRuins
				//case(_type call _ruinsCheck):{
				case(_x isKindOf "Ruins"):{
					diag_log format["#PVPFW found ruin  %1 %2",_x, _type];
					_delay = 0.05;
					_nearEntities = (getPosATL _x) nearEntities [["CAManBase","Air","LandVehicle"],pvpfw_cleanUp_ruinRadius];
					//@todo we shall check if no player entities are in the area!
					if (count _nearEntities == 0) then{
						deleteVehicle _x;
						diag_log format["#PVPFW module_cleanup: deleting destroyed building. type = %1",_type];
					};
				};
				#endif
				
				#ifdef __pvpfw_cleanUp_cleanExtra
				case(_x isKindOf "SmokeShell"):{ //actually for chemlights, but they area child of the smokeShell class
					_delay = 0.03;
					
					_index = _chemLightObjects find _x;
					
					if (_index == -1) then{
						_chemLightObjects set[count _chemLightObjects,_x];
						_chemLightTime set[count _chemLightTime,diag_tickTime];
					}else{
						_chemLightSetTime = _chemLightTime select _index;
						if (diag_tickTime > (_chemLightSetTime + pvpfw_cleanUp_chemLightTimer)) then{
							deleteVehicle _x;
							diag_log format["#PVPFW module_cleanup: deleting chemlight"];
						};
					};
				};
				case(_x isKindOf "PipeBombBase" || _x isKindOf "ClaymoreDirectionalMine_Remote_Ammo"):{
					_delay = 0.05;
					
					_index = _pipeBombObjects find _x;
					
					if (_index == -1) then{
						_pipeBombObjects set[count _pipeBombObjects,_x];
						_pipeBombTime set[count _pipeBombTime,diag_tickTime];
					}else{
						_pipeBombSetTime = _pipeBombTime select _index;
						if (diag_tickTime > (_pipeBombSetTime + pvpfw_cleanUp_pipeBombTimer)) then{
							deleteVehicle _x;
							diag_log format["#PVPFW module_cleanup: deleting remotBomb"];
						};
					};
				};
				#endif
				
				#ifdef __pvpfw_cleanUp_customCondition
				case(_x call pvpfw_cleanUp_customCondition):{
					_x call pvpfw_cleanUp_customRemoveScript;
				};
				#endif
			};
		};
		sleep _delay;
			  
	}forEach (allMissionObjects _checkTypes);

	// delete all empty groups, no wait time foreseen, if units not removed from groups, then the group can be deleted next time	   
	{
		_grp = _x;
		if(({alive _x}count units _grp)==0)then{deleteGroup _grp;};
  	}forEach allGroups;
	#ifdef __pvpfw_cleanUp_cleanExtra
	//clean the chemlight array
	{
		if (isNull _x) then{
			_chemLightObjects set[_forEachIndex,objNull];
			_chemLightTime set[_forEachIndex,0];
		};
	}forEach _chemLightObjects;
	_chemLightObjects = _chemLightObjects - [objNull];
	_chemLightTime = _chemLightTime - [0];
	//clean the pipebomb array
	{
		if (isNull _x) then{
			_pipeBombObjects set[_forEachIndex,objNull];
			_pipeBombTime set[_forEachIndex,0];
		};
	}forEach _pipeBombObjects;
	_pipeBombObjects = _pipeBombObjects - [objNull];
	_pipeBombTime = _pipeBombTime - [0];
	#endif
	sleep PVPFW_WAIT_TIME;
	(pvpfw_cleanup_run < 1);
};

diag_log format["#PVPFW end of cylic cleanup scipt"];