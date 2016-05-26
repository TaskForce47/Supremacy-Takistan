/* Author : Raini
Description :
Decides on param in description.ext where the debugmessage should be printed.
Parameter :
0 (Optional):
 STRING - Debug Message
1 (Optional):
STRING - Location
Returns :Nothing

Example  String: ["Hello World!","Mond"] call TF47_Helper_fnc_debugCase;
Example Array:
_message = [1,2,3,4];
_location = "Mond";
[_message,_location] call TF47_Helper_fnc_debugCase;
*/
private ["_message","_debugmsg","_location","_loc"];
_message = "No Debug Message";
_location = "No Location transmitted";
_message = _this select 0;
_location = _this select 1;
_debugmsg = format ["%1",_message];
_loc = format ["%1",_location];
switch (f_var_debugMode) do { 
		case 1 : {[_debugmsg, _loc, [true, true, true] ] call CBA_fnc_debug;}; 
		case 2 : {[_debugmsg, _loc, [false, true, true] ] call CBA_fnc_debug;}; 
		default {[_debugmsg, _loc, [false, false, false] ] call CBA_fnc_debug;}; 
};