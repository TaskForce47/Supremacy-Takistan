_thislist = _this select 0;
_location = _this select 1;
_type = _this select 2;

{ 
	_veh = _x;

	_drv = driver _veh;
	_dmg = getDammage _veh;
	_dist = _veh distance _location;
	_pos = getPos _veh;
	_height = _pos select 2;
		
	if (_drv == _veh) then {
		// not a vehicle
		
	} else { if (player != _drv) then {
		// not the driver

	} else { if (!(_veh isKindOf _type)) then {
		// wrong type		

	} else { if (_height > 10) then {
		// Veh too high
		
	} else { if (_dist > 10) then {
		// too far away			
		
	} else { if (_veh getVariable ["tf47service", false]) then {
		// already being serviced	
		
	} else {	
			
		[_veh, _location, _type] execVM "vehicleService\vehicleServiceInitSub.sqf"; 
						
	}; }; }; }; }; };
	
} forEach _thislist;