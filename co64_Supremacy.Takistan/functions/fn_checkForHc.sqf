/*
*	@description
*		Checks for the HeadlessClient
* 	@params none
*
*	@returns:
*		nothing
* 	@example: 
* 		[] call checkForHc; - checks for the headlessclient
*
* 	@Tested with :
* 		ToDo
*
*	@category   Helper
* 	@package    TF47 Helper
* 	@author     [TF47] Willard
* 	@website	http://armasim.de/
* 	@version    0.1a
*/
// isServer;

_parId = _this select 0;

_ret = false;

if (_parId == 0) then {
	if(headlessClientActive && isMultiplayer) then {
		if(!isServer && !hasInterface) then {
			_ret = true;
		};
	} else {
		if(isServer) then {
			_ret = true;
		};
	};
} else {
	// i know this is shitty but iccl
	if(_parId == 1 && (clientOwner == (hcOwner getVariable ["tf47_sup_hc1_ownerID", -1]))) then {
		_ret = true;
	};
	if(_parId == 2 && (clientOwner == (hcOwner getVariable ["tf47_sup_hc2_ownerID", -1]))) then {
		_ret = true;
	};
	if(_parId == 3 && (clientOwner == (hcOwner getVariable ["tf47_sup_hc3_ownerID", -1]))) then {
		_ret = true;
	};
};

if(!headlessClientActive) then {
	_ret = true;
};

_ret;