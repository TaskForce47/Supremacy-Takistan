disableSerialization;
private ["_dialog","_curSel","_type","_name","_leader","_freq","_item","_listBox","_pic","_tooltip","_var","_markerName","_marker","_yoffset"];
_dialog = uiNamespace getVariable "tf47_core_umenu_ft_dialog_var";

_cursel = (lbCurSel (_dialog displayCtrl 2100));
_type = (_dialog displayCtrl 2100) lbData _curSel;

// _name = ctrlText (_dialog displayCtrl 1400);

_name = "";
// hint str(ctrlVisible 1400);
// edit callsign
if(ctrlVisible 1400) then {
	_name = ctrlText (_dialog displayCtrl 1400);
	// hint format ["1%1",_name];
} else {
	// combo callsign
	if(ctrlVisible 2101) then {
		_name = lbText [2101,(lbCurSel 2101)];
		// hint format ["2%1",_name];
	} else {
		hint "Something weird happened...";
	};
};

_leader = ctrlText (_dialog displayCtrl 1401);
if (_name == "" or _leader == "") exitWith {};// hint "Name or Leader was empty!"; };

_freq = ctrlText (_dialog displayCtrl 1402);

//Save the team in tf47_core_umenu_ft_logic
_team = [_type,_name,_leader,_freq]; 
_var = tf47_core_umenu_ft_logic getVariable ["tf47_core_umenu_ft_lbContent",[]];
_var = _var + [_team];
tf47_core_umenu_ft_logic setVariable ["tf47_core_umenu_ft_lbContent",_var,true];

//Add Group to ListBox
_listBox = _dialog displayCtrl 1801;

_listBox lbAdd _name;

_tacSign = format ["\a3\ui_f\data\map\Markers\NATO\%1.paa",_type];
_listBox lbSetPicture [(count _var - 1),_tacSign];
_listBox lbSetPictureColor [(count _var - 1),[1,1,1,1]];

_tooltip = "";
if (isNil "_freq" or _freq == "") then {
	_tooltip = format ["Leader: %1",_leader];
} else {
	_tooltip = format ["%1 | Channel: %2",_leader, _freq];
};

_listBox lbSetTooltip [(count _var -1),_tooltip];

//CreateMarker on Map
_markerName = format ["tf47_core_umenu_ft_%1",(count _var - 1)];
_yoffset = (count _var - 1) * 200;

_marker = createMarker [_markerName,[(getMarkerPos "tf47_core_umenu_ft_startmarker") select 0,(((getMarkerPos "tf47_core_umenu_ft_startmarker") select 1) - _yoffset)]];
_marker setMarkerShape "ICON";  
_marker setMarkerType _type;

// Color
_color = switch true do {
	case (_type == "b_hq"): {
		"ColorGreen";
	};
	case (_type == "b_mech_inf"): {
		"ColorOrange";
	};
	case (_type == "b_armor"): {
		"ColorOrange";
	};	
	case (_type == "b_air"): {
		if(_name in ["RAVEN-01","RAVEN-02","BUTTERFLY-01","BUTTERFLY-02","PELICAN","GRIFFIN","GOOSE","ALBATROS"]) then {
			"ColorBrown";
		} else {
			if(_name == "DUSTOFF") then {
				"ColorRED";
			} else {
				"ColorOrange";
			};
		};
	};	
	case (_type == "b_plane"): {
		"ColorGreen";
	};
	default {
		"ColorBLUFOR";
	};
};
_marker setMarkerColor _color;

if (isNil "_freq" or _freq == "") then {
	_marker setMarkerText format [" %1 | %2",_name,_leader];
} else {
	_marker setMarkerText format [" %1 | %2 | Channel: %3",_name,_leader,_freq];
};