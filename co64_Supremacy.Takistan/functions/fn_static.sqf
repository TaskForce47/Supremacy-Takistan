

_ao = position (_this select 0);
diag_log "---------------------stuff";
diag_log str _ao;
_staticType = "";
_staticType2 = ""; 
_crew = "";

switch (tf47_param_vehiclemod) do { 
	// Van
	case 0 : {
		_staticType = "I_static_AT_F"; 
		_staticType2 = "I_static_AT_F";
		_crew = "I_soldier_F";
	};
	// CUP
	case 1 : {
		_staticType = "CUP_O_D30_AT_TK";
		_staticType2 = "CUP_O_ZU23_TK_INS";
		_crew = "CUP_O_TK_Soldier";
	};
	// RHS
	case 2 : {
		_staticType = "rhsgref_ins_g_SPG9"; 
		_staticType2 = "rhsgref_ins_g_NSV_TriPod";
		_crew = "rhs_vdv_rifleman";
	};
};

for "_x" from 1 to 2 do {
	_staticGroup = createGroup resistance;
	_randomPos = [_ao, 200, 10, 10] call BIS_fnc_findOverwatch;
	_static = _staticType createVehicle _randomPos;
	waitUntil{!isNull _static};
	_static setMass 1000;	
	_static setDir random 360;
	_static setVectorUp [0,0,1];
	_static setPos [((getPos _static) select 0),((getPos _static) select 1),((getPos _static) select 2) + 2.5];
	_static setVectorUp [0,0,1];
	_static setVectorUp (surfaceNormal (position _static));
	sleep 5;
	_crew createUnit [_randomPos,_staticGroup];
	((units _staticGroup) select 0) assignAsGunner _static;
	((units _staticGroup) select 0) moveInGunner _static;
	_staticGroup setBehaviour "COMBAT";
	_staticGroup setCombatMode "RED";
	_static lock 3;
	_static = objNull;
};
_staticGroup = createGroup resistance;
_randomPos = [_ao, 200, 10, 10] call BIS_fnc_findOverwatch;
_static = _staticType2 createVehicle _randomPos;
waitUntil{!isNull _static};	
_static setMass 1000;
_static setDir random 360;
_static setVectorUp [0,0,1];
_static setPos [((getPos _static) select 0),((getPos _static) select 1),((getPos _static) select 2) + 2.5];
_static setVectorUp [0,0,1];
_static setVectorUp (surfaceNormal (position _static));
sleep 5;
_crew createUnit [_randomPos,_staticGroup];
((units _staticGroup) select 0) assignAsGunner _static;
((units _staticGroup) select 0) moveInGunner _static;
_staticGroup setBehaviour "COMBAT";
_staticGroup setCombatMode "RED";
_static lock 3;