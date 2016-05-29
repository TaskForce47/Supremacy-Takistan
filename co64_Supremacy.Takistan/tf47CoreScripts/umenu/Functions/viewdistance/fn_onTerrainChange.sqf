private["_type"];
_type = _this select 0;
if(_type == "") exitWith {};
	
switch (_type) do
{
	case "none": {
		if((isNil "tf47_core_umenu_vd_disablenone")) then {
			terrainMode = "none";
			setTerrainGrid 50;
		};
	};
	case "low": {
		terrainMode = "low";
		setTerrainGrid 30;
	};
	case "norm": {
		terrainMode = "norm";
		setTerrainGrid 12.5;
	};
	case "high": {
		terrainMode = "high";
		setTerrainGrid 3.125;
	};
};