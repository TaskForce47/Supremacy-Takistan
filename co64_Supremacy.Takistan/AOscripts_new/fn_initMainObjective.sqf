if(!([] call TF47_Helper_fnc_checkForHc)) exitwith {};
#include "AO_cfg.sqf"

	tf47_supremacy_main_var_AOObjects = [];
	tf47_supremacy_main_var_AOUnits = [];
	tf47_supremacy_main_var_AOGroups = [];
	tf47_supremacy_main_var_Marker = [];
	tf47_supremacy_main_var_Tasks = [];
	tf47_supremacy_main_var_HeliPad = [];
	tf47_supremacy_main_var_radiotowers = [];
	tf47_supremacy_main_var_trigger = [];	
	tf47_supremacy_main_var_missionState = [];
	tf47_supremacy_main_var_missionCreationOngoing = [];
	tf47_supremacy_main_var_Bunker = [];
	tf47_supremacy_main_var_reinforcementTriggers = [];

tf47_supremacy_main_var_mainCount = 0;
tf47_supremacy_main_var_AOCollection = [
	[log_timurkulay,"Timurkulay",350],
	//[log_chadarakht,"Chadarakht",350],
	[log_gamarud,"Gamarud",350],
	[log_gamsar,"Garmsar",350],
	[log_imarat,"Imarat",350],
	[log_zavarak, "Zavarak",350],
	[log_karachinar,"Karachinar",350],
	[log_ravanay,"Ravanay",350],
	[log_nagara,"Nagara",350],
	[log_shamali,"Shamali",350],
	[log_airfield,"Rasman Airfield",500],
	[log_rasman,"Rasman",350],
	[log_bastam,"Bastam",350],
	[log_falar,"Falar",350],
	[log_mulladost,"Mulladost",350],
	[log_nur,"Nur",350],								
	[log_feruz,"Feruz Abad",350],
	[log_jilavur,"Jilavur",350],
	[log_chak,"Chak Chak",350],
	[log_landay,"Landay",350],								
	[log_shukukurlay,"Shukukurlay",350],
	[log_chaman,"Chaman",350],							
	[log_sakhe,"Sakhe",350]
];

{
	tf47_supremacy_main_var_AOObjects pushBack[];
	tf47_supremacy_main_var_AOUnits pushBack[];
	tf47_supremacy_main_var_AOGroups pushBack [];
	tf47_supremacy_main_var_Bunker pushBack [];
	tf47_supremacy_main_var_Marker pushBack[];	
	tf47_supremacy_main_var_trigger pushBack objNull;
	tf47_supremacy_main_var_reinforcementTriggers pushBack objNull;
	tf47_supremacy_main_var_HeliPad pushBack objNull;
	tf47_supremacy_main_var_radiotowers pushBack objNull;
	tf47_supremacy_main_var_HeliPad pushback objNull;	
	tf47_supremacy_main_var_missionCreationOngoing pushBack false;
	tf47_supremacy_main_var_missionState pushBack TF47_MISSION_STATE_NEW;


}foreach tf47_supremacy_main_var_AOCollection;







