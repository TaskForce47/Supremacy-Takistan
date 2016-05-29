#define DLG (uiNamespace getVariable "KitPick_Dlg")
#define COMBO (uiNamespace getVariable "KitPick_Combo")
#define USEBUTTON (uiNamespace getVariable "KitPick_UseBtn")

KitPickInit =
{
    uiNamespace setVariable ["KitPick_Dlg", _this select 0];
    uiNamespace setVariable ["KitPick_Combo", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["KitPick_UseBtn", (_this select 0) displayCtrl 3];

    USEBUTTON ctrlEnable false;

    private "_idx";
    _idx = COMBO lbAdd "Commander"; COMBO lbSetData [_idx, "co"];
    _idx = COMBO lbAdd "Deputy Commander"; COMBO lbSetData [_idx, "dc"];
    COMBO lbAdd "----";
	
	_idx = COMBO lbAdd "Medic"; COMBO lbSetData [_idx, "m"];
    _idx = COMBO lbAdd "Combat First Responder"; COMBO lbSetData [_idx, "cfr"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Fire Team Leader"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Automatic Rifleman"; COMBO lbSetData [_idx, "ar"];
    _idx = COMBO lbAdd "Asst. Automatic Rifleman"; COMBO lbSetData [_idx, "aar"];
    _idx = COMBO lbAdd "Rifleman (AT)"; COMBO lbSetData [_idx, "rat"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Designated Marksman"; COMBO lbSetData [_idx, "dm"];
    _idx = COMBO lbAdd "UAV Operator"; COMBO lbSetData [_idx, "uav"];    
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Sniper"; COMBO lbSetData [_idx, "sn"];
    _idx = COMBO lbAdd "Spotter"; COMBO lbSetData [_idx, "sp"];
    COMBO lbAdd "----";
    
    _idx = COMBO lbAdd "Medium Machine Gunner"; COMBO lbSetData [_idx, "mmgg"];
    _idx = COMBO lbAdd "Medium Machine Gunner Asst."; COMBO lbSetData [_idx, "mmgag"];   
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Anti Tank Gunner"; COMBO lbSetData [_idx, "matg"];     
    _idx = COMBO lbAdd "Asst. Anti Tank Gunner"; COMBO lbSetData [_idx, "matag"];     
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Anti Air Missile Gunner"; COMBO lbSetData [_idx, "msamg"];     
    _idx = COMBO lbAdd "Asst. Anti Air Missile Gunner"; COMBO lbSetData [_idx, "msamag"];     
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Engineer Demolitian"; COMBO lbSetData [_idx, "eng"];
    _idx = COMBO lbAdd "Engineer Mines"; COMBO lbSetData [_idx, "engm"];    
    COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Rifleman"; COMBO lbSetData [_idx, "r"];
    _idx = COMBO lbAdd "Carabineer"; COMBO lbSetData [_idx, "car"];
	_idx = COMBO lbAdd "Submachinegunner"; COMBO lbSetData [_idx, "smg"];
    _idx = COMBO lbAdd "Grenadier"; COMBO lbSetData [_idx, "gren"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Ground Vehicle Commander"; COMBO lbSetData [_idx, "vc"];
    _idx = COMBO lbAdd "Ground Vehicle Driver"; COMBO lbSetData [_idx, "vd"];
    _idx = COMBO lbAdd "Ground Vehicle Gunner"; COMBO lbSetData [_idx, "vg"];    
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Air Vehicle Commander"; COMBO lbSetData [_idx, "pcc"];
    _idx = COMBO lbAdd "Air Vehicle Pilot"; COMBO lbSetData [_idx, "pp"];
    _idx = COMBO lbAdd "Air Vehicle Crew"; COMBO lbSetData [_idx, "pc"];
    	
    _sel = player getVariable "KitPicker_Selection";
    if (!isNil '_sel') then
    {
        COMBO lbSetCurSel _sel;
    };
};

KitPicker_Pick =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith {};

    _data = COMBO lbData _idx;
    if (_data == "") exitWith {};

    closeDialog 0;
    player setVariable ["f_var_JIP_loadout", _data];
    player setVariable ["KitPicker_Selection", _idx];
    f_var_JIP_state = 3;
};

KitPicker_OnSelChanged =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };

    _data = COMBO lbData _idx;
    if (_data == "") exitWith
    {
        USEBUTTON ctrlEnable false;
    };
    USEBUTTON ctrlEnable true;
};
