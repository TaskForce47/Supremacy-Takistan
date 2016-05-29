private ["_location","_position","_vehicles"];

if (tf47_var_FOBStatus == 1) exitWith {};

tf47_var_FOBStatus = 1;
publicVariable "tf47_var_FOBStatus";

_vehicles = [fobhelipad,fob31,fob32,fob33,fob34,fob35,fob36,fob37,fob38,fob39,fob40,
			 fob1,fob2,fob3,fob4,fob5,fob6,fob7,fob8,fob9,fob10,
			 fob11,fob12,fob13,fob14,fob15,fob16,fob17,fob18,fob19,fob20,
			 fob21,fob22,fob23,fob24,fob25,fob26,fob27,fob28,fob29,fob30,
			 fobtable
			];

fob1 setvariable ["ace_medical_isMedicalFacility", false];

_location = getPos fobtable;

_position = _location findEmptyPosition [0,35,"Land_Cargo10_military_green_F"];
fobContainer1 setPos _position;
sleep 0.5;

_position = _location findEmptyPosition [0,35,"Land_Cargo10_military_green_F"];
fobContainer2 setPos _position;
sleep 0.5;

_position = _location findEmptyPosition [0,35,"Land_Cargo10_military_green_F"];
fobContainer3 setPos _position;
sleep 0.5;

{
	if (_x distance fobtable <150) then
	{
		remoteExec ['tf47_fnc_buildFOBlocal', _x];
	};
} forEach allPlayers;

{
	deleteVehicle _x;
	sleep 0.55;
} forEach _vehicles;

deleteMarker "fobmarker";

tf47_var_FOBStatus = 0;
publicVariable "tf47_var_FOBStatus";