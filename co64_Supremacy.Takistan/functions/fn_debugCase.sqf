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
private ["_message","_debugmsg","_location","_loc","_alert"];
_message = if (count _this >= 1) then { _this select 0; }else{ "No Debug Message";};;
_location = if (count _this > 1) then { _this select 1; }else{ "No Location Message";};
_debugmsg = format ["INFO : %1",_message];
_loc = format ["COMPONENT : %1",_location];

if (!isNil "f_var_debugMode") then {
	switch (f_var_debugMode) do { 
			case 1 : {[_debugmsg, _loc, [true, true, true] ] call CBA_fnc_debug;}; 
			case 2 : {[_debugmsg, _loc, [false, true, true] ] call CBA_fnc_debug;}; 
			default {[_debugmsg, _loc, [false, false, false] ] call CBA_fnc_debug;}; 
	};
} else {
	_alert = format ["f_var_debugMode not initalized, %1",_loc];
	[_debugmsg, _alert, [false, true, true] ] call CBA_fnc_debug;
}; 