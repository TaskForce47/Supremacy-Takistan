/*
*	@description
*		Creates a fortified SA-20 Radar and launch site
* 	@params (param 0 is required):
* 		param 0: postion | <array>
*
*	@returns:
*		all created objects
* 	@example: 
* 		[[0,0,0]] spawn buildSA20; - spawns a SA-20 Radar and launch site at 0,0,0
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
private["_pos","_xx","_yy","_zz","_allObjects","_newNest","_newVehicle","_newCamonet","_newDeco","_sa20Group"];

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

_newNest = createVehicle ['pook_Land_fort_rampart_DES', [_xx - 13.5,_yy - 0.5,_zz], [], 0, 'CAN_COLLIDE'];
_newNest setDir ((getDir _newNest) - 225);
_allObjects pushBack _newNest;

_newNest = createVehicle ['pook_Land_fort_rampart_DES', [_xx + 13.5,_yy - 0.5,_zz], [], 0, 'CAN_COLLIDE'];
_newNest setDir ((getDir _newNest) + 225);
_allObjects pushBack _newNest;

_newNest = createVehicle ['pook_Land_fort_rampart_DES', [_xx - 18.75,_yy - 13,_zz], [], 0, 'CAN_COLLIDE'];
_newNest setDir ((getDir _newNest) + 90);
_allObjects pushBack _newNest;

_newNest = createVehicle ['pook_Land_fort_rampart_DES', [_xx + 18.75,_yy - 13,_zz], [], 0, 'CAN_COLLIDE'];
_newNest setDir ((getDir _newNest) - 90);
_allObjects pushBack _newNest;

// create the c&c radar
_newVehicle = createVehicle ['pook_9S36_TAK', [_xx + 5,_yy - 25,_zz], [], 0, 'NONE'];
_newVehicle setVehicleLock "LOCKED";
_allObjects pushBack _newVehicle;

_newVehicle = createVehicle ['pook_PU12_TAK', [_xx - 5,_yy - 25,_zz], [], 0, 'NONE'];
_newVehicle setVehicleLock "LOCKED";
_allObjects pushBack _newVehicle;

// create camonets
_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx + 6.5,_yy - 20,_zz + 2], [], 0, 'CAN_COLLIDE'];
_newCamonet allowDamage false;
_newCamonet setDir ((getDir _newCamonet) - 90);
_allObjects pushBack _newCamonet;

_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx - 6,_yy - 25,_zz + 2], [], 0, 'CAN_COLLIDE']; 
_newCamonet allowDamage false;
_newCamonet setDir ((getDir _newCamonet) - 90);
_allObjects pushBack _newCamonet;

// create decoration
_newDeco = createVehicle ['cup_tkordnancebox_ep1', [_xx,_yy - 25,_zz], [], 0, 'CAN_COLLIDE'];
_newDeco allowDamage false;
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['land_tableplastic_01_f', [_xx,_yy - 25,_zz], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['land_campingchair_v2_f', [_xx + 0.5,_yy - 26,_zz], [], 0, 'CAN_COLLIDE'];
_newDeco setDir ((getDir _newDeco) - 180);
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['land_campingchair_v2_f', [_xx - 0.5,_yy - 26,_zz], [], 0, 'CAN_COLLIDE'];
_newDeco setDir ((getDir _newDeco) - 180);
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['land_campingchair_v2_f', [_xx + 0.5,_yy - 24,_zz], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['land_campingchair_v2_f', [_xx - 0.5,_yy - 24,_zz], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newDeco;

_newDeco = createVehicle ['cup_a2_laptop', [_xx + 0.5,_yy - 25.25,_zz + 0.89], [], 0, 'CAN_COLLIDE'];
_allObjects pushBack _newDeco;
_newDeco = createVehicle ['cup_a2_laptop', [_xx - 0.5,_yy - 24.75,_zz + 0.89], [], 0, 'CAN_COLLIDE'];
_newDeco setDir ((getDir _newDeco) - 180);
_allObjects pushBack _newDeco;

// create more camo
_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx,_yy - 25,_zz + 2], [], 0, 'CAN_COLLIDE']; 
_newCamonet allowDamage false;
_newCamonet setDir ((getDir _newCamonet) - 90);
_allObjects pushBack _newCamonet;

_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx,_yy - 34,_zz + 2], [], 0, 'CAN_COLLIDE']; 
_newCamonet allowDamage false;
_allObjects pushBack _newCamonet;

// create the oppsoite nest
_newNest = createVehicle ['Land_fort_artillery_nest_EP1', [_xx,_yy - 45,_zz], [], 0, 'CAN_COLLIDE']; 
_newNest setDir ((getDir _newNest) + 180);
_allObjects pushBack _newNest;

_newNest = createVehicle ['pook_Land_fort_rampart_DES', [_xx + 13.5,_yy + 0.5  - 40,_zz], [], 0, 'CAN_COLLIDE'];
_newNest setDir ((getDir _newNest) - 225 - 180);
_allObjects pushBack _newNest;

_newNest = createVehicle ['pook_Land_fort_rampart_DES', [_xx - 13.5,_yy + 0.5  - 40,_zz], [], 0, 'CAN_COLLIDE'];
_newNest setDir ((getDir _newNest) + 225 + 180);
_allObjects pushBack _newNest;

_newNest = createVehicle ['pook_Land_fort_rampart_DES', [_xx + 18.75,_yy - 27,_zz], [], 0, 'CAN_COLLIDE'];
_newNest setDir ((getDir _newNest) + 90 + 180);
_allObjects pushBack _newNest;

_newNest = createVehicle ['pook_Land_fort_rampart_DES', [_xx - 18.75,_yy - 36,_zz], [], 0, 'CAN_COLLIDE'];
_newNest setDir ((getDir _newNest) + 22.5);
_allObjects pushBack _newNest;

_newNest = createVehicle ['Land_fort_artillery_nest_EP1', [_xx - 25,_yy - 25,_zz], [], 0, 'CAN_COLLIDE']; 
_newNest setDir ((getDir _newNest) - 90);
_allObjects pushBack _newNest;

_newCamonet = createVehicle ['pook_camonet_land_east_FARP5', [_xx - 14,_yy - 31,_zz + 2], [], 0, 'CAN_COLLIDE']; 
_newCamonet allowDamage false;
_allObjects pushBack _newCamonet;

// group for the sa-20 radar and launchers
_sa20Group = createGroup east;

// create the main radar
_newVehicle = createVehicle ['pook_30N6E2_TAK', [_xx - 20,_yy - 29,_zz], [], 0, 'NONE']; 
_newVehicle setDir ((getDir _newVehicle) - 67.5);
createVehicleCrew _newVehicle;
(crew _newVehicle) join _sa20Group;
_newVehicle setskill 1;
_allObjects pushBack _newVehicle;

// create the SA-20 Launchers
_newVehicle = createVehicle ['pook_SA20_static_TAK', [_xx,_yy - 10,_zz], [], 0, 'NONE'];
_newVehicle allowDamage false;
_newVehicle setVehicleLock "LOCKED";
_newVehicle allowDamage true;
createVehicleCrew _newVehicle;
(crew _newVehicle) join _sa20Group;
_newVehicle setskill 1;
_allObjects pushBack _newVehicle;

_newVehicle = createVehicle ['pook_SA20_static_TAK', [0,0,10000], [], 0, 'NONE'];
_newVehicle allowDamage false;
_newVehicle setDir ((getDir _newVehicle) + 184);
_newVehicle setPos [_xx,_yy - 40,_zz];
_newVehicle setVehicleLock "LOCKED";
_newVehicle allowDamage true;
createVehicleCrew _newVehicle;
(crew _newVehicle) join _sa20Group;
_newVehicle setskill 1;
_allObjects pushBack _newVehicle;

// return all created objects
_allObjects;
