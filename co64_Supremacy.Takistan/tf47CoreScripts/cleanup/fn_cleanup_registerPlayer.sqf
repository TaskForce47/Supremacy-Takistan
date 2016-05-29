/*
 *  Start an handler which takes care about the body removement
 * 
*/

player addEventHandler["killed", {
    private ["_playerBody"];
    _playerBody = param [0, objNull];
    ["TF47_cleanup_ev_registerDeadPlayerBody", [_playerBody]] call CBA_fnc_globalEvent;	    
}];
    
    
//player addEventHandler["respawn", {}];