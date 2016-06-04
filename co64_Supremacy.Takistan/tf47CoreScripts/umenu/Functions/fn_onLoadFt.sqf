disableSerialization;
_dialog = (_this select 0) select 0;
(_dialog displayCtrl 2101) ctrlShow true;
(_dialog displayCtrl 2101) ctrlShow false;

_var = tf47_core_umenu_ft_logic getVariable ["tf47_core_umenu_ft_lbContent",[]];


//Group ListBox
_listBox = _dialog displayCtrl 1801;
{
	_name = (_x select 1);
	_listBox lbAdd _name;
	
	_pic = format ["\a3\ui_f\data\map\Markers\NATO\%1.paa",_x select 0];
	_listBox lbSetPicture [_forEachIndex,_pic];
	_listBox lbSetPictureColor [_forEachIndex, [1,1,1,1]];
	
	_freq = (_x select 3);
	_tooltip = "";
	if (isNil "_freq" or _freq == "") then {
		_tooltip = format ["Leader: %1",(_x select 2)];
	} else {
		_tooltip = format ["%1 | Channel: %2",(_x select 2), _freq];
	};
	_listBox lbSetTooltip [_forEachIndex,_tooltip];
} forEach _var;
/*
 *
 *	["b_inf","Infantry"],["b_recon","Recon"],["b_hq","Headquarters"],
 *  ["b_mech_inf","Mechanized Infantry"],["b_air","Helicopter (Trans.)"],
 *	["b_air","Helicopter (Attack)"],["b_plane","Plane (Trans.)"],["b_plane","Plane (Attack)"],
 *	["b_armor","Armor"],["b_support","Support"],["b_uav","UAV"],
 *	["b_motor_inf","Motorized Infantry"],["b_naval","Naval"],
 *	["b_med", "Medical Support"],["b_mortar","Mortar"],
_typeMarker =  [["b_inf","Infantry"],["b_recon","Recon"],["b_mortar","Mortar"],
				["b_mech_inf","Mechanized Infantry"],["b_armor","Armor"],["b_air","Helicopter (Trans.)"],
				["b_air","Helicopter (Attack)"],["b_plane","Plane (Trans.)"],["b_plane","Plane (Attack)"],
				["b_hq","Headquarters"],["b_support","Support"],["b_med", "Medical Support"]];

**/
_slotName = format ["%1", player];

_typeArrays = switch true do {
	case (["UnitNATO_AH", _slotName] call BIS_fnc_inString): {
		[[["b_air","Helicopter (Attack)"]],["MANTICORE","FIREFLY"]];
	};	
	case (["UnitNATO_AFW", _slotName] call BIS_fnc_inString): {
		[[["b_plane","Plane (Attack)"]],["THUNDERBIRD","WASP","EAGLE"]];
	};	
	case ((["UnitNATO_DC", _slotName] call BIS_fnc_inString) || (["UnitNATO_CO", _slotName] call BIS_fnc_inString)): {
		[[["b_hq","Headquarters"]],["GODFATHER","TOPMAN","TOWER"]];
	};
	case ((["UnitNATO_A", _slotName] call BIS_fnc_inString) || (["UnitNATO_B", _slotName] call BIS_fnc_inString) || (["UnitNATO_C", _slotName] call BIS_fnc_inString) || (["UnitNATO_ENG", _slotName] call BIS_fnc_inString)): {
		[[["b_inf","Infantry"],["b_mortar","Mortar"],["b_support","Support"],["b_med", "Medical Support"]],[]];
	};
	case (["UnitNATO_ST", _slotName] call BIS_fnc_inString): {
		[[["b_recon","Recon"]],[]];
	};
	case (["UnitNATO_IFV", _slotName] call BIS_fnc_inString): {
		[[["b_mech_inf","IFV"]],["TIGER-01","TIGER-02","TIGER-03","GATOR-01","GATOR-02"]];
	};
	case (["UnitNATO_TNK", _slotName] call BIS_fnc_inString): {
		[[["b_armor","Tank"]],["RHINO-01","RHINO-02","LION-01","LION-02","FROG-01"]];
	};
	case (["UnitNATO_TH", _slotName] call BIS_fnc_inString): {
		[[["b_air","Helicopter (Trans.)"],["b_plane","Plane (Trans.)"]],["RAVEN-01","RAVEN-02","DUSTOFF","BUTTERFLY-01","BUTTERFLY-02","PELICAN","GRIFFIN","GOOSE","ALBATROS"]];
	};
};

// Populate the combobox for the type
_typeMarker = _typeArrays select 0;
_typeCombo = (_dialog displayCtrl 2100);

{
	_name = _x select 1;
	_typeCombo lbAdd _name;

	_tacticalSign = format ["\a3\ui_f\data\map\Markers\NATO\%1.paa",(_x select 0)];
	_typeCombo lbSetPicture [_forEachIndex,_tacticalSign];
	_typeCombo lbSetPictureColor [_forEachIndex, [1,1,1,1]];
	_typeCombo lbSetPictureColorSelected [_forEachIndex, [1,1,1,1]];

	_typeCombo lbSetData [_forEachIndex, _x select 0];

} forEach _typeMarker;

_typeCombo lbSetCurSel 0;

_typeCallsign = _typeArrays select 1;
(_dialog displayCtrl 1401) ctrlSetText (name player);
// hint str _typeCallsign;
if((count _typeCallsign) != 0) then {
	(_dialog displayCtrl 1400) ctrlShow false;
	(_dialog displayCtrl 2101) ctrlShow true;
	
	_callsignCombo = (_dialog displayCtrl 2101);
	{
		_name = _x;
		_callsignCombo lbAdd _name;
		_callsignCombo lbSetData [_forEachIndex, format ["Number#%1",_forEachIndex]];
	} forEach _typeCallsign;
	
	_callsignCombo lbSetCurSel 0;
};


