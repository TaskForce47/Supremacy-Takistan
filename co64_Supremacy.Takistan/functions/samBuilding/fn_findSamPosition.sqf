/*
*	@description
*		Searches for an empty position
* 	@params (all params are required):
* 		param 0: start postion | <array>
* 		param 1: minimal distance to start pos | <number>
* 		param 2: maxmimal distance to start pos | <number>
* 		param 3: threshold (max expansion) | <number>
*
*	@returns:
*		the empty position or []
* 	@example: 
* 		[[0,0,0], 10, 50, 100] call findSamPosition;
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
private["_startPos","_minDist","_maxDist","_threshold","_foundPos","_add"];

// arguments
_startPos = _this select 0;
_minDist = _this select 1;
_maxDist = _this select 2;
_threshold = _this select 3;

// init vars
_foundPos = [];
_add = 0;

// search for empty pos unitl threshold is reached
// xor ((a || b) && !(a && b))
while {!((((count _foundPos) == 0) || ((_maxDist + _add) < _threshold)) && !(((count _foundPos) == 0) && ((_maxDist + _add) < _threshold)))} do {
	// _foundPos = _startPos findEmptyPosition [_minDist, (_maxDist + _add)];
	_foundPos = [_startPos, _minDist, (_maxDist + _add),7, 20, 0, 0] call BIS_fnc_findSafePos;
	_add = _add + 5;
};

_foundPos = [(_foundPos select 0), (_foundPos select 1), 0];

// return the found posScreenToWorld
_foundPos;