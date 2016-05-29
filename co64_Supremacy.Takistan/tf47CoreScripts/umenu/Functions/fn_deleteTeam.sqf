disableSerialization;
private ["_dialog","_curSel","_var"];
_dialog = uiNamespace getVariable "tf47_core_umenu_ft_dialog_var";
_ctrl = _dialog displayCtrl 1801;
_curSel = lbCurSel _ctrl;

//Check if a item is sleected
if (_curSel == -1) exitWith {};

_var = tf47_core_umenu_ft_logic getVariable ["tf47_core_umenu_ft_lbContent",[]];

//get item 
_item = _var select _curSel;

//Delete Marker
_markerName = format ["tf47_core_umenu_ft_%1",_curSel];
deleteMarker _markerName;

//replace all other Marker
for "_i" from _curSel to count _var -1 do {
		//delete old Marker
		_markerName = format ["tf47_core_umenu_ft_%1",_i];
		_type = MarkerType _markerName;
		_text = markerText _markerName;
		_color = markerColor _markerName;
		deleteMarker _markerName;
		if(_color == "") then {
			_color = "ColorBLUFOR";
		};
		//create new Marker
		_yoffset = 200* (_i -1);
		_markerName = format ["tf47_core_umenu_ft_%1",(_i -1)];
		_marker = createMarker [_markerName,[(getMarkerPos "tf47_core_umenu_ft_startmarker") select 0,(((getMarkerPos "tf47_core_umenu_ft_startmarker") select 1) - _yoffset)]];
		_marker setMarkerShape "ICON";  
		_marker setMarkerType _type;
		_marker setMarkerText _text;
		_marker setMarkerColor _color;
};		


//remove item
_var = _var - [_item];
tf47_core_umenu_ft_logic setVariable ["tf47_core_umenu_ft_lbContent",_var,true];


_ctrl lbDelete _curSel;
//[[[_ctrl,_cursel], {(_this select 0) lbDelete (_this select 1)}], "BIS_fnc_call",true, true] call BIS_fnc_MP;
