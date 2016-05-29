

if(!createDialog "tf47_umenu_vd_dialog") exitWith {hint "Couldn't open the dialog!"};
disableSerialization;

_slideCtrlArr = [[1900,viewDistanceFoot],[1901,viewDistanceCar],[1902,viewDistanceAir],[1903,viewDistanceObject]];
_textCtrlArr = [[1400,viewDistanceFoot],[1401,viewDistanceCar],[1402,viewDistanceAir],[1403,viewDistanceObject]];

{
	ctrlSetText[(_x select 0), str (_x select 1)];
} forEach _textCtrlArr;

_display = uiNamespace getVariable "tf47_core_umenu_vd_dialog_var";
if(!(isNil "_display")) then {
	{
		slidersetRange [(_x select 0),100,15000];
		(_display displayCtrl (_x select 0)) sliderSetSpeed [100,100,100];
		sliderSetPosition[(_x select 0), (_x select 1)];
	} foreach _slideCtrlArr;
} else {
	hint "Couldn't find the dialog. Something went wrong.";
};