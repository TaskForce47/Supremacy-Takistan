////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Willard, v1.063, #Qenetu)
////////////////////////////////////////////////////////
class tf47_umenu_vd_dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['tf47_core_umenu_vd_dialog_var',_this select 0];";
	onUnLoad = "uiNamespace setVariable ['tf47_core_umenu_vd_dialog_var',nil]";
	class ControlsBackground
	{
		class tf47_umenu_vd_main: tf47_umenu_base_rsctext
		{
			idc = 1000;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};

		class tf47_umenu_vd_title: tf47_umenu_base_rsctext
		{
			idc = 1001;
			text = "TF47 U-Menu"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.397 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
		};
		class tf47_umenu_vd_foottext: tf47_umenu_base_rsctext
		{
			idc = 1002;
			text = "On Foot:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_vd_cartext: tf47_umenu_base_rsctext
		{
			idc = 1003;
			text = "In Car:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_vd_airtext: tf47_umenu_base_rsctext
		{
			idc = 1004;
			text = "In Air:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_vd_grasstext: tf47_umenu_base_rsctext
		{
			idc = 1006;
			text = "Grass:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_vd_objecttext: tf47_umenu_base_rsctext
		{
			idc = 1007;
			text = "Object:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class Controls
	{
		class tf47_umenu_vd_footslider: tf47_umenu_base_slider
		{
			idc = 1900;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[0,_this select 1] call tf47_core_umenu_vd_fnc_onSliderChange;";
		};
		class tf47_umenu_vd_footedit: tf47_umenu_base_rscedit
		{
			idc = 1400;
			text = "10000"; //--- ToDo: Localize;
			x = 0.554 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyUp = "[0,_this select 1] call tf47_core_umenu_vd_fnc_onValueChange;";
		};
		class tf47_umenu_vd_nonebtn: tf47_umenu_base_textbutton
		{
			idc = 1600;
			text = "None"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			action = "['none'] call tf47_core_umenu_vd_fnc_onTerrainChange;";
		};
		class tf47_umenu_vd_lowbtn: tf47_umenu_base_textbutton
		{
			idc = 1601;
			text = "Low"; //--- ToDo: Localize;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			action = "['low'] call tf47_core_umenu_vd_fnc_onTerrainChange;";
		};
		class tf47_umenu_vd_normalbtn: tf47_umenu_base_textbutton
		{
			idc = 1602;
			text = "Normal"; //--- ToDo: Localize;
			x = 0.515 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.033 * safezoneW;
			h = 0.022 * safezoneH;
			action = "['norm'] call tf47_core_umenu_vd_fnc_onTerrainChange;";
		};
		class tf47_umenu_vd_highbtn: tf47_umenu_base_textbutton
		{
			idc = 1603;
			text = "High"; //--- ToDo: Localize;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			action = "['high'] call tf47_core_umenu_vd_fnc_onTerrainChange;";
		};
		class tf47_umenu_vd_carslider: tf47_umenu_base_slider
		{
			idc = 1901;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[1,_this select 1] call tf47_core_umenu_vd_fnc_onSliderChange;";
		};
		class tf47_umenu_vd_airslider: tf47_umenu_base_slider
		{
			idc = 1902;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[2,_this select 1] call tf47_core_umenu_vd_fnc_onSliderChange;";
		};
		class tf47_umenu_vd_caredit: tf47_umenu_base_rscedit
		{
			idc = 1401;
			text = "10000"; //--- ToDo: Localize;
			x = 0.554 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyUp = "[1,_this select 1] call tf47_core_umenu_vd_fnc_onValueChange;";
		};
		class tf47_umenu_vd_airedit: tf47_umenu_base_rscedit
		{
			idc = 1402;
			text = "10000"; //--- ToDo: Localize;
			x = 0.554 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyUp = "[2,_this select 1] call tf47_core_umenu_vd_fnc_onValueChange;";
		};
		class tf47_umenu_vd_objectslider: tf47_umenu_base_slider
		{
			idc = 1903;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[3,_this select 1] call tf47_core_umenu_vd_fnc_onSliderChange;";
		};
		class tf47_umenu_vd_objectedit: tf47_umenu_base_rscedit
		{
			idc = 1403;
			text = "10000"; //--- ToDo: Localize;
			x = 0.554 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyUp = "[3,_this select 1] call tf47_core_umenu_vd_fnc_onValueChange;";
		};
		class tf47_umenu_vd_closebtn: tf47_umenu_base_rscbutton_main
		{
			idc = 1604;
			text = "Close"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.601 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
		class tf47_umenu_vd_backbtn: tf47_umenu_base_rscbutton_main
		{
			idc = 1605;
			text = "Back"; //--- ToDo: Localize;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.601 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0; createDialog 'tf47_umenu_main_dialog';";
		};
		class tf47_umenu_vd_savebtn: tf47_umenu_base_rscbutton_main
		{
			idc = 1606;
			text = "Save permanently"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.601 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[] call tf47_core_umenu_vd_fnc_saveViewdistance;";
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
