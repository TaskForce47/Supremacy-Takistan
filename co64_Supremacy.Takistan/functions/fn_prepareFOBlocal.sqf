private ["_position","_location","_direction","_dir","_angle"];

if (tf47_var_FOBStatus == 1) exitWith {hint composeText ["Die Aktion ist gerade nicht verfügbar.", lineBreak, lineBreak, "This action is currently not available."]};

if ((fobContainer1 distance fobContainer2) + (fobContainer2 distance fobContainer3) + (fobContainer1 distance fobContainer3) >60) exitWith {hint composeText ["Der Abstand der Kisten ist zu hoch.", lineBreak, lineBreak, "The distance between the containers is too high."]};

if (!(tf47_var_FOBhelper isEqualTo [])) exitWith{};

/*

_nearRoads = fobContainer1 nearRoads 15;

_location = [0,0];
_dir = 0;
_angle = 0;

if (count _nearRoads < 0) exitWith {hint composeText ["Es sind keine Straßen in der Nähe.", lineBreak, lineBreak, "There are no roads nearby."]};

{
	_road = _x;
	_roadConnectedTo = roadsConnectedTo _road;
	_connectedRoad = _roadConnectedTo select 0;
	_dir = [_road, _connectedRoad] call BIS_fnc_DirTo;

	_roadPos = getPos _road;

	_center1 = [(_roadPos select 0) + 15*sin(_dir+90),(_roadPos select 1) + 15*cos(_dir+90)];
	_center2 = [(_roadPos select 0) + 15*sin(_dir-90),(_roadPos select 1) + 15*cos(_dir-90)];

	if ([_center1, (_dir + 90), 50, 30, 15, [player,fobcontainer1,fobcontainer2,fobcontainer3]] call tf47_fnc_isFlatEmpty == 1) then
	{
		_angle = _dir;
		_location = _roadPos;
	};
	if ([_center2, (_dir - 90), 50, 30, 15, [player,fobcontainer1,fobcontainer2,fobcontainer3]] call tf47_fnc_isFlatEmpty == 1) then
	{
		_angle = _dir + 180;
		_location = _roadPos;
	};

} forEach _nearRoads;

*/

tf47_var_FOBhelper = [];
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [0, 18, 2] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [0, 18, 1] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [0, 18, 0.5] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [-14, 18, 2] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [-14, 18, 1] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [-14, 18, 0.5] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [14, 18, 2] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [14, 18, 1] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [14, 18, 0.5] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [0, 3, 0.1] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [-14, 3, 2] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [-14, 3, 1] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [-14, 3, 0.5] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [14, 3, 2] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [14, 3, 1] ];
tf47_var_FOBhelper pushback _ball;
_ball = createVehicle ["Sign_Sphere25cm_F", getPos player, [], 0, "NONE"];
_ball attachTo [player, [14, 3, 0.5] ];
tf47_var_FOBhelper pushback _ball;

_action = player addAction ["Set F.O.B. Position", "[] call tf47_fnc_checkFOBlocal"];

_timer = 0;

while {(player distance fobcontainer1 < 80) && (_timer < 8)} do
{
	sleep 5;
	_timer = _timer + 1;
};

player removeAction _action;

{
	deleteVehicle _x;
} forEach tf47_var_FOBhelper;

tf47_var_FOBhelper = [];
/*

_angle = getDir player;
_location = getPos player;

[_location, _angle] remoteExec ["tf47_fnc_buildFOB", 2];

*/