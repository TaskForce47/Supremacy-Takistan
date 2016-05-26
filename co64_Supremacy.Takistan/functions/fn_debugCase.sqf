/* Author : Raini
Description :
Decides on param in description.ext where the debugmessage should be printed.
Parameter :
0 (Optional):
 STRING - Debug Message

Returns :Nothing

Example  String: ["Hello World!"] call TF47_Helper_fnc_debugCase;
Example Array:
_message = [1,2,3,4];
[_message] call TF47_Helper_fnc_debugCase;
*/
private ["_message","_debugmsg"];
params ["_message"];
_debugmsg = format "_message";
switch (f_var_debugMode) do { 
		case 1 : {[ _dbgmessage, "cba_network", [true, true, true] ] call CBA_fnc_debug;}; 
		case 2 : {[ _dbgmessage, "cba_network", [false, true, true] ] call CBA_fnc_debug;}; 
		default {[ _dbgmessage, "cba_network", [false, false, false] ] call CBA_fnc_debug;}; 
};