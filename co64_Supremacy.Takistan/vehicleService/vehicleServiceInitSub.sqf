_veh = _this select 0;
_location = _this select 1;
_type = _this select 2;

_veh setVariable ["tf47service", true, true];

	_respawnactive = false;
	if (_veh getVariable ["RespawnSystemActive", false]) then {
		_respawnactive = true;
	};

	_vehServ1 = 0;
	_vehServ2 = 0;
	_vehServ3 = 0;
	_vehServ10 = 0;
	_vehServ11 = 0;
	_vehServ12 = 0;
	_vehServ13 = 0;
	_vehServ14 = 0;
	_vehServ15 = 0;
	_vehServ16 = 0;
	_vehServ17 = 0;
	_vehServ18 = 0;
	_vehServ19 = 0;
	_vehServ20 = 0;
	_vehServ21 = 0;
	_vehServ99 = 0;

	_vehServ1 = _veh addAction [("<t color=""#fa8f3e"">" + ("Repair Vehicle") + "</t>"), "vehicleService\vehicleRepairSubroutine.sqf", [_veh]];  
	_vehServ2 = _veh addAction [("<t color=""#fa8f3e"">" + ("Refuel Vehicle") + "</t>"), "vehicleService\vehicleRefuelSubroutine.sqf", [_veh]];  
	_vehServ3 = _veh addAction [("<t color=""#fa8f3e"">" + ("Rearm Vehicle") + "</t>"), "vehicleService\vehicleAmmoSubroutine.sqf", [_veh]];  

	if(!(_veh isKindOf "Plane")&&!(_veh isKindOf "Helicopter")) then {
		_vehServ10 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Infantry") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "CarInf"]];  
		_vehServ11 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Anti Tank") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "CarAT"]];  
		_vehServ12 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Combined Operations") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "CarCO"]];  
		_vehServ13 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Medical") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "CarMed"]];
		_vehServ14 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Mortar") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "CarMortar"]];
		_vehServ15 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Sniper") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "CarSniper"]];
		_vehServ20 = _veh addAction [("<t color=""#fadf3e"">" + ("Empty Loadout") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "CarEmpty"]];
	};
	if(_veh isKindOf "Plane") then {
		_vehServ16 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Paratrooper") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "PlanePara"]];	
	};
	if(_veh isKindOf "Helicopter") then {
		_vehServ17 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Infantry") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "HeloInf"]];  
		_vehServ18 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Anti Tank") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "HeloAT"]];
		_vehServ19 = _veh addAction [("<t color=""#fadf3e"">" + ("Loadout: Medical") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "HeloMed"]];
		_vehServ21 = _veh addAction [("<t color=""#fadf3e"">" + ("Empty Loadout") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_veh, "HeloEmpty"]];		
	};

	if (_respawnactive) then {
		_vehServ99 = _veh addAction [("<t color=""#fa4f3e"">" + ("Respawn Vehicle") + "</t>"), "vehicleService\vehicleRespawnSubroutine.sqf", [_veh]];  
	};

	while {(_veh distance _location) < 10} do { sleep 5 };

	_veh removeaction _vehServ1;
	_veh removeaction _vehServ2;
	_veh removeaction _vehServ3;
	_veh removeaction _vehServ10;
	_veh removeaction _vehServ11;
	_veh removeaction _vehServ12;
	_veh removeaction _vehServ13;
	_veh removeaction _vehServ14;
	_veh removeaction _vehServ15;
	_veh removeaction _vehServ16;
	_veh removeaction _vehServ17;
	_veh removeaction _vehServ18;
	_veh removeaction _vehServ19;
	_veh removeaction _vehServ20;
	_veh removeaction _vehServ21;
	_veh removeaction _vehServ99;

_veh setVariable ["tf47service", false, true];