private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		viewDistanceFoot = round(_value);
		ctrlSetText[1400,(str viewDistanceFoot)];
		[] call tf47_core_umenu_vd_fnc_updateViewDistance;
	};
	
	case 1:
	{
		viewDistanceCar = round(_value);
		ctrlSetText[1401,(str viewDistanceCar)];
		[] call tf47_core_umenu_vd_fnc_updateViewDistance;
	};
	
	case 2:
	{
		viewDistanceAir = round(_value);
		ctrlSetText[1402,(str viewDistanceAir)];
		[] call tf47_core_umenu_vd_fnc_updateViewDistance;
	};
	
	case 3: {
		viewDistanceObject = round(_value);
		ctrlSetText[1403,(str viewDistanceObject)];
		setObjectViewDistance [viewDistanceObject,100];
	};
};