// startTowing.sqf

// Get the Tow Vehicle
_tow = _this select 3;

// get the nearest objects
_tgt = ((nearestObjects [_tow, ["Plane","Helicopter"], 20]) select 0);
if(isNil "_tgt") exitWith{};
_type = typeOf _tgt;

// initialise default Vars
_attachArr = [0,0,0];
_vectorUp = [0,0,1];
_notSup = false;

/* 
 *  adjust Vectors depending on Vehicle Type
 *  cargo attachTo [tow, [0,-6.5,2.25]]; cargo setVectorUp ([[sin 0,-sin 5,cos 0 * cos 5],-0] call BIS_fnc_rotateVector2D);
 *  This can be used to calculate the arrays
 */
 hint str _type;
switch true do {
	case (["CUP_B_AV8B", _type] call BIS_fnc_inString) : {
		_attachArr = [0,-6.5,2.25];
		_vectorUp = [0,-0.0871557,0.996195];
	};
	case (["CUP_B_A10", _type] call BIS_fnc_inString) : {
		_attachArr = [0,-7,0.8];
		_vectorUp = [0,0.0174524,0.999848];
	};	
	case (["CUP_B_C130J", _type] call BIS_fnc_inString) : {
		_attachArr = [0,-13.5,5.6];
		_vectorUp = [0,0.00872654,0.999962];
	};	
	case (["CUP_B_CH47", _type] call BIS_fnc_inString) : {
		_attachArr = [0,-8.75,3.65];
		_vectorUp = [0,-0.0174524,0.999848];
	};	
	case (["CUP_B_UH60", _type] call BIS_fnc_inString) : {
		_attachArr = [0,-7.85,2.55];
		_vectorUp = [-0.0029465,0.00369676,0.999989];
	};	
	case (["CUP_B_MV22_USMC", _type] call BIS_fnc_inString) : {
		_attachArr = [0,-9.2,3.5];
		_vectorUp = [0,0.0261769,0.999657];
	};	
	case (["CUP_USMC_MQ9", _type] call BIS_fnc_inString) : {
		_attachArr = [0,-6,1.85];
		_vectorUp = [-0.00157233,-0.000386787,0.999999];
	};
	default {
		_notSup = true;
	};
};

if(_notSup) exitWith{};

// attach and adjust
_tgt attachTo [_tow, _attachArr];
_tgt setVectorUp _vectorUp;

// add the Stop Towing action
_tow setVariable["tf47_isTowing", true, true];
_ret = _tow addAction ["Stop towing", {detach ((_this select 3) select 0); ((_this select 3) select 1) setVariable["tf47_isTowing", false, true];}, [_tgt,_tow] ];

// remove the action when the towing ist complete
[_ret, _tow] spawn {
	waitUntil{ sleep 1; (!((_this select 1) getVariable["tf47_isTowing", false]))};
	(_this select 1) removeAction (_this select 0);
};