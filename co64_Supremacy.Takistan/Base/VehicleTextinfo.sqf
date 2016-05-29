_unit = _this select 0;
_callsignparam= _this select 1;
_unitDescription = getText (configFile >> "CfgVehicles" >> typeOf _unit  >> "displayName");
_callsign = format ["Callsign: %1",_callsignparam];
ret = [_unitDescription,_callsign] spawn BIS_fnc_infoText;