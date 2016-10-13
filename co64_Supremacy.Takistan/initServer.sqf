// init of serverside variables

tf47_var_FOBStatus = 0;
publicVariable "tf47_var_FOBStatus";

tf47_var_iedTracker = [];

tf47_var_mainCount = 0;

		tf47_var_AOCollection = [[log_timurkulay,"Timurkulay"],[log_gamarud,"Gamarud"],[log_gamsar,"Garmsar"],[log_imarat,"Imarat"],
								 [log_zavarak,"Zavarak"],[log_karachinar,"Karachinar"],[log_ravanay,"Ravanay"],[log_nagara,"Nagara"],
								 [log_shamali,"Shamali"],[log_rasman,"Rasman"],[log_bastam,"Bastam"],[log_falar,"Falar"],[log_mulladost,"Mulladost"],
								 [log_nur,"Nur"],[log_feruz, "Feruz Abad"],[log_jilavur,"Jilavur"],[log_chak,"Chak Chak"],[log_landay,"Landay"],[log_shukukurlay,"Shukukurlay"],
								 [log_chaman,"Chaman"],[log_sakhe,"Sakhe"]];						

diag_log "------------------ AO Checks -----------------------";										
{
	if(((getPos (_x select 0)) distance [0,0,0]) == 0) then {
		diag_log format['[Supremacy] Error at AO "%1" ',(_x select 1)];
	} else {
		diag_log format['[Supremacy] Check passed for AO "%1" ',(_x select 1)];
	};
} forEach tf47_var_AOCollection;
									

tf47_var_AOObjects = [];
tf47_var_AOUnits = [];

tf47_var_reinforcements_heliUnarmed = 0;
tf47_var_reinforcements_heliArmed = 0;
tf47_var_reinforcements_jetArmed = 0;

tf47_var_mainEnemyCount = 0;