/*
*	@description
*		Creates a fortified supply point consisting of an refuel and ammo truck.
* 	@params (param 0 is required):
* 		param 0: postion | <array>
*
*	@returns:
*		all created objects
* 	@example: 
* 		[[0,0,0]] spawn buildSupply; - spawns a supply point at 0,0,0
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
private["_pos","_xx","_yy","_zz","_allObjects","_newNest","_newVehicle","_newCamonet"];

// Arguments
_pos = _this select 0;

// Split the position
_xx = _pos select 0;
_yy = _pos select 1;
_zz = _pos select 2;

_allObjects = [];

// Create the fortified position
_newNest = createVehicle ['Land_fort_artillery_nest_EP1', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE']; 
_newNest setPos [_xx,_yy,_zz];
_newNest setPos (getpos _newNest);
_allObjects pushBack _newNest;

_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE']; 
_newCamonet setPos [_xx,_yy - 4,_zz + 2];
_allObjects pushBack _newCamonet;

_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx,_yy,_zz], [], 0, 'CAN_COLLIDE']; 
_newCamonet setPos [_xx,_yy - 8,_zz + 2];
_allObjects pushBack _newCamonet;

// create the supply vehicles
_newVehicle = createVehicle ['cup_o_ural_refuel_tka', [_xx - 2.5,_yy - 8,_zz], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newVehicle;
_newVehicle = createVehicle ['cup_o_ural_reammo_tka', [_xx + 2.5,_yy - 8,_zz], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newVehicle;

// return all created objects
_allObjects;


