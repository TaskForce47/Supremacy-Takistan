private ["_position","_location","_direction","_dir","_angle"];

if (tf47_var_FOBStatus == 1) exitWith {hint composeText ["Die Aktion ist gerade nicht verfügbar.", lineBreak, lineBreak, "This action is currently not available."]};

if ((fobContainer1 distance fobContainer2) + (fobContainer2 distance fobContainer3) + (fobContainer1 distance fobContainer3) >100) exitWith {hint composeText ["Der Abstand der Kisten ist zu hoch.", lineBreak, lineBreak, "The distance between the containers is too high."]};

if (fobContainer1 distance player > 50) exitWith {hint composeText ["Der Abstand zu den Kisten ist zu hoch.", lineBreak, lineBreak, "The distance to the containers is too high."]};

_angle = (getDir player);
_location = getPos player;
_location = [(_location select 0) + 8 * sin(_angle), (_location select 1) + 8 * cos(_angle)];//, (_location select 2)];
if ([_location, _angle, 22, 15, 7, [player,fobcontainer1,fobcontainer2,fobcontainer3]] call tf47_fnc_isFlatEmpty == 0) exitWith {hint composeText ["Das Gelände ist nicht frei oder uneben.", lineBreak, lineBreak, "The area is not flat/empty."]};

_location = getPos player;

{
	deleteVehicle _x;
} forEach tf47_var_FOBhelper;

tf47_var_FOBhelper = [];
[_location, (_angle - 90)] remoteExec ["tf47_fnc_buildFOB", 2];