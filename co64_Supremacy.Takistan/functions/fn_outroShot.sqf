//if (isServer) exitWith {};

_camera = "camera" camcreate [3380.36,13238.9,0];

_camera camPrepareTarget [(getMarkerPos "ao_mkr1") select 0, (getMarkerPos "ao_mkr1") select 1, -10];
_camera camPreparePos [((getMarkerPos "ao_mkr1") select 0) + 100, ((getMarkerPos "ao_mkr1") select 1) - 70,100];
_camera camPrepareFOV 0.489;
_camera camPrepareBank -10;
_camera camCommitPrepared 0;


sleep 3;
titlecut ["","BLACK OUT",2];
sleep 2;

titlecut ["","BLACK IN",0.5];

_camera cameraeffect ["internal", "back"];
showCinemaBorder true;
playSound "outro";

_camera camPrepareTarget [((getMarkerPos "ao_mkr1") select 0) + 40, ((getMarkerPos "ao_mkr1") select 1) - 10, -5];
_camera camPreparePos [((getMarkerPos "ao_mkr1") select 0) + 150, ((getMarkerPos "ao_mkr1") select 1) - 150,30];
_camera camPrepareFOV 0.7;
_camera camPrepareBank -10;
_camera camCommitPrepared 0;

_camera camPrepareTarget [((getMarkerPos "ao_mkr1") select 0) - 40, ((getMarkerPos "ao_mkr1") select 1) + 10, -5];
_camera camPreparePos [((getMarkerPos "ao_mkr1") select 0) - 150, ((getMarkerPos "ao_mkr1") select 1) - 150,25];
_camera camPrepareFOV 0.75;
_camera camPrepareBank -10;
_camera camCommitPrepared 30;

sleep 2;

_text = [
	[
		[" ","<t align = 'center' shadow = '1' size = '2.0' font='PuristaMedium'>%1</t><br/><br/>", 0.06],
		["CONGRATULATIONS!","<t align = 'center' shadow = '1' size = '2.0' font='PuristaMedium'>%1</t><br/><br/>", 0.06],
		["","<t align = 'center' shadow = '1' size = '1.7' font='PuristaBold'>%1</t><br/><br/>", 0.06],
		["Opfor was defeated!","<t align = 'center' shadow = '1' size = '1.4' font='PuristaMedium'>%1</t><br/><br/>", 0.06]
	]
] spawn TF47_fnc_typeText;

sleep 11;

titleRsc ["outro","PLAIN"];