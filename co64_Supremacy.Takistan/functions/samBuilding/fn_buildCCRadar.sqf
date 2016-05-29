/*
*	@description
*		Creates a fortified command and control radar postion
* 	@params (param 0 is required):
* 		param 0: postion | <array>
*
*	@returns:
*		all created objects
* 	@example: 
* 		[[0,0,0]] spawn buildCCRadar; - spawns a command and control radar at 0,0,0
*
* 	@Tested with :
* 		ToDo
*
*	@category   ToDo
* 	@package    TF47 Sam Site Builder
* 	@author     [TF47] Willard
* 	@website	http://armasim.de/
* 	@version    0.1a
*/
private["_pos","_xx","_yy","_zz","_allObjects","_newNest","_newVehicle","_newCamonet","_newDeco"];

// Arguments
_pos = _this select 0;

// Split the position
_xx = _pos select 0;
_yy = _pos select 1;
_zz = _pos select 2;

_allObjects = [];

// Create the nest
_newNest = createVehicle ['Land_fort_artillery_nest_EP1', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE']; 
_newNest setPos [_xx,_yy,_zz];
_allObjects pushBack _newNest;

_newNest = createVehicle ['Land_fort_artillery_nest_EP1', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE']; 
_newNest setPos [_xx,_yy - 13,_zz];
_newNest setDir (getDir _newNest - 180);
_allObjects pushBack _newNest;

_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE']; 
_newCamonet setPos [_xx,_yy - 5,_zz + 2];
_allObjects pushBack _newCamonet;

_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE']; 
_newCamonet setPos [_xx,_yy - 10,_zz + 2];
_allObjects pushBack _newCamonet;

// Create the C&C Radar
_newVehicle = createVehicle ['pook_pu12_tak', [_xx,_yy - 6,_zz], [], 0, 'CAN_COLLIDE'];
_newVehicle setVehicleLock "LOCKED";
_allObjects pushBack _newVehicle;

_newVehicle = createVehicle ['pook_prv11_tak', [_xx,_yy - 14,_zz], [], 0, 'CAN_COLLIDE'];
_newVehicle setVehicleLock "LOCKED";
_newVehicle setDir (getDir _newVehicle - 180);
_allObjects pushBack _newVehicle;

// Create decoration
_newDeco = createVehicle ['cup_tkordnancebox_ep1', [_xx - 4,_yy - 10,_zz], [], 0, 'CAN_COLLIDE'];
_newDeco allowDamage false;
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['land_tableplastic_01_f', [_xx - 4,_yy - 10,_zz], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['cup_a2_laptop', [_xx - 4,_yy - 10,_zz + 0.89], [], 0, 'CAN_COLLIDE'];
_newDeco setDir ((getDir _newDeco) - 180);
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['land_campingchair_v2_f', [_xx - 3.5,_yy - 9,_zz], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['land_campingchair_v2_f', [_xx - 4.5,_yy - 9,_zz], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newDeco;

// return all created objects
_allObjects;

