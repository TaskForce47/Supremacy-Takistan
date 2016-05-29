private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
// _value = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		viewDistanceFoot = parseNumber (ctrlText 1400);
		sliderSetPosition[1900, viewDistanceFoot];
		[] call tf47_core_umenu_vd_fnc_updateViewDistance;
	};
	
	case 1:
	{
		viewDistanceCar = parseNumber (ctrlText 1401);
		sliderSetPosition[1901, viewDistanceCar];
		[] call tf47_core_umenu_vd_fnc_updateViewDistance;
	};
	
	case 2:
	{
		viewDistanceAir = parseNumber (ctrlText 1402);
		sliderSetPosition[1902, viewDistanceAir];
		[] call tf47_core_umenu_vd_fnc_updateViewDistance;
	};
	
	case 3: {
		viewDistanceObject = parseNumber (ctrlText 1403);
		sliderSetPosition[1903, viewDistanceObject];
		setObjectViewDistance [tawvd_object,100];
	};
};