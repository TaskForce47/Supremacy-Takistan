//ARMA3Alpha function LV_fnc_removeGroup v0.3 - by Fred
//removes fillHouse or militarize units 
//Syntax: nul = [LVgroup*] execVM "LV\LV_functions\LV_fnc_removeGroupV3.sqf";
// * = id number (which is defined in fillHouse or militarize, so if ID is 10 the give 10)
private["_grp"];

_grpID = _this select 0;
call compile format ["_grp = LVgroup%1",_grpId];
{
	if(vehicle _x != _x)then
	{
		_veh = vehicle _x;		
		{
            //getting rid of the frikkin gunners!
			_x assignAsDriver _veh;
			unassignVehicle _x;
			moveOut _x;
			_x setPos [0,0,0];
			deleteVehicle _x;
		}forEach crew _veh;
		deleteVehicle _veh;	
	}
	else
	{
		deleteVehicle _x;
	};
}forEach units _grp;