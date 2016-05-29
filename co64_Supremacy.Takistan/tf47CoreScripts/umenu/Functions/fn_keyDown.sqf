_par = _this select 0;
_keyCode = _par select 1;
_ctrlKey = _par select 3;
_player = Player;
_tickets = 0;

if (_ctrlKey and (_keyCode == 22) and !(dialog)) then {
	createDialog "tf47_umenu_main_dialog";

	_dialog = uiNamespace getVariable "tf47_umenu_main_dialog_var";
	_name = name _player;
	
	if (leader (group _player) != _player) then {
		_ctrl = _dialog displayCtrl 1602;
		_ctrl ctrlEnable false;
		_ctrl ctrlSetTooltip "You have to be the group leader to change your Group Name";
	};
};
