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
_ret = false;
if(headlessClientActive && isMultiplayer) then {
    if(!isServer && !hasInterface) then {
		_ret = true;
    };
} else {
    if(isServer) then {
		_ret = true;
	};
};

_ret;