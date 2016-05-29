/*
*	@description
*		Creates a single fortified Sam Launcher. Sam type depends on param 1
* 	@params (param 0 and 1 are required):
* 		param 0: postion | <array>
*		param 1: class name | <string>
*
*	@returns:
*		all created objects
* 	@example: 
* 		[[0,0,0],"pook_sa3_tracked_tak"] spawn buildSingleSam; - spawns a mobile SA-3 Launcher at 0,0,0
*
* 	@Tested with :
* 		ToDo
*
*	@category   ToDo
* 	@package    TF47 Sam Site Builder
* 	@author     [TF47] Willard, hcpookie (animation code)
* 	@website	http://armasim.de/
* 	@version    0.1a
*/   
private["_pos","_xx","_yy","_zz","_allObjects","_newNest","_newVehicle"];

// Arguments
_pos = _this select 0;
_type = _this select 1;

// split the position
_xx = _pos select 0;
_yy = _pos select 1;
_zz = _pos select 2;

_allObjects = [];

// Spawn the Arty Nest only when the vehicle doesn't have is own camo
if(_type != "pook_P12_RU") then {
	_newNest = createVehicle ['pook_Land_fort_artillery_nest_DES', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE']; 
	_newNest setPos [_xx,_yy,_zz];
	_newNest setPos (getpos _newNest);
	_newNest setDir 90;	
	_allObjects pushBack _newNest;
	_newNest = createVehicle ['pook_Land_fort_artillery_nest_DES', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE'];  
	_newNest setPos [_xx - 5,_yy + 4, _zz];  
	_newNest setDir 350;
	_newNest setPos (getpos _newNest);
	_allObjects pushBack _newNest;
	sleep 2;
};

// spawn vehicle and crew
_newVehicle = createVehicle [_type, [_xx - 5,_yy - 3,_zz], [], 0, 'NONE'];
createVehicleCrew _newVehicle;
_newVehicle setSkill 1;

_allObjects pushBack _newVehicle;

// Prevent the vehicle from driving away
_newVehicle setFuel 0;
(driver _newVehicle) disableAI "MOVE";
(gunner _newVehicle) disableAI "MOVE";
(commander _newVehicle) disableAI "MOVE";

// In case we spawned a P12 Truck, it will extend his radar and deploy his own camonet
if(_type == "pook_P12_RU") then {

	_newVehicle setVehicleLock "LOCKED";

	_newVehicle animate ['hatch',1];
	_newVehicle animate ['radar_tower',1]; 
	_newVehicle animate ['radar_tower_segment1', 1]; 
	_newVehicle animate ['radar_tower_segment2', 1]; 
	_newVehicle animate ['radar_tower_segment3', 1]; 
	_newVehicle animate ['radar_tower_segment4', 1]; 
	_newVehicle animate ['radar_tower_segment5', 1]; 
	_newVehicle animate ['radar_tower_segment6',1];
	sleep 20;
	_newVehicle animate ['radar_arm_left_hide',0];
	_newVehicle animate ['radar_arm_right_hide',0];
	_newVehicle animate ['radar_arm_left',0];
	_newVehicle animate ['radar_arm_right',0];
	sleep 10;
	_newVehicle animate ['radar_arm_right_hide',1];
	_newVehicle animate ['radar_arm_left_hide',1];
	_newVehicle animate ['radar_hide',0];
	_newVehicle animate ['radar_tower_hide',1];
	_newVehicle animate ['camonet',0];
};

// return all created Objects
_allObjects;