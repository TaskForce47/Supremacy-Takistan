// initTowingTractor.sqf
_veh = _this select 0;
_veh addAction ["Start towing", "tf47CoreScripts\towingTractor\startTowing.sqf", _veh, 1.5, true, true, "", "!(_target getVariable[""tf47_isTowing"", false])"];