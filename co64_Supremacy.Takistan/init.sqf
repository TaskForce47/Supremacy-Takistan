// ====================================================================================

// F3 - Disable Saving and Auto Saving
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSaving [false, false];

// ====================================================================================

// F3 - Mute Orders and Reports
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSentences false;


// ====================================================================================

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_briefing = [] execVM "briefing.sqf";

// ====================================================================================

// F3 - F3 Folk ARPS Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setGroupIDs = [] execVM "f\setGroupID\f_setGroupIDs.sqf";

// ====================================================================================

// F3 - F3 Common Local Variables
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT
if(isServer) then {
	f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";
};

// ====================================================================================

// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// not used, TF Core Script will handle that functionality 
//f_var_removeBodyDelay = 10;
//f_var_removeBodyDistance = 0;
// f_var_doNotRemoveBodies = [];
//[] execVM "f\removeBody\f_addRemoveBodyEH.sqf";

// ====================================================================================

// F3 - Assign Gear AI
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

 [] execVM "f\assignGear\f_assignGear_AI.sqf";

// ====================================================================================

// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

//[] execVM "f\briefing\f_orbatNotes.sqf";

// ====================================================================================

// F3 - Loadout Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\briefing\f_loadoutNotes.sqf";


// ====================================================================================

// F3 - JIP setup
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_var_JIP_FirstMenu = false;		// Do players connecting for the first time get the JIP menu? - This only works in missions with respawn.
f_var_JIP_RemoveCorpse = true;		// Remove the old corpse of respawning players?
f_var_JIP_GearMenu = false;			// Can JIP/respawned players select their own gear? False will use gear assigned by F3 Gear Component if possible

// ====================================================================================

// F3 - AI Unit Caching
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[30] spawn f_fnc_cInit;

// Note: Caching aggressiveness is set using the f_var_cachingAggressiveness variable; possible values:
// 1 - cache only non-leaders and non-drivers
// 2 - cache all non-moving units, always exclude vehicle drivers
// 3 - cache all units, incl. group leaders and vehicle drivers
f_var_cachingAggressiveness = 1;

// ====================================================================================

// F3 - Radio Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\radios\radio_init.sqf";

// ====================================================================================

// F3 - Medical Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\medical\medical_init.sqf";

//TF47 Basetransport

BaseTransport = compile preprocessFile "Base\BaseTransport.sqf";

// ======================== Mission init ================================
headlessClientActive = if(isNil "headlessClient") then {False} else {True};
publicVariable "headlessClientActive";
if(headlessClientActive) then {
	waitUntil {((!isNil "headlessClient2") && (!isNil "headlessClient3"))};
};
// Spawn units on the HC if hes active
// otherwise spawn him on the server
if(!isServer && !hasInterface) then {
	if ((hcOwner getVariable ["tf47_sup_hc1_ownerID", -1]) == -1) then {
		hcOwner setVariable ["tf47_sup_hc1_ownerID", clientOwner, true];
	} else {
		if ((hcOwner getVariable ["tf47_sup_hc2_ownerID", -1]) == -1) then {
			hcOwner setVariable ["tf47_sup_hc2_ownerID", clientOwner, true];
		} else {
			if ((hcOwner getVariable ["tf47_sup_hc3_ownerID", -1]) == -1) then {
				hcOwner setVariable ["tf47_sup_hc3_ownerID", clientOwner, true];
			} else {
				diag_log "[Supremacy] No more HCs pls ty";
			};
		};
	};
};

if(headlessClientActive && isMultiplayer) then {
    if(!isServer && !hasInterface) then {
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
		sleep 1;

		tf47_var_AOObjects = [];
        diag_log "[Supremacy] HeadlessClient: Spawning the AI on the HeadlessClient!";
		if(clientOwner == (hcOwner getVariable ["tf47_sup_hc1_ownerID", -1])) then {
			[] execVM "AOscripts\AOstart.sqf";
			sleep 0.1;
		} else {
			if(clientOwner == (hcOwner getVariable ["tf47_sup_hc2_ownerID", -1])) then {
				[] execVM "SIDEscripts\SIDEstart.sqf";
				sleep 0.1;
			} else {
				if(clientOwner == (hcOwner getVariable ["tf47_sup_hc2_ownerID", -1])) then {
					[] execVM "Patrols\init.sqf";
					sleep 0.1;
				};
			};
		};
    };
} else { 
    if(isServer) then {
        diag_log "[Supremacy] HeadlessClient: Spawning the AI on the Server!";
		[] execVM "AOscripts\AOstart.sqf";
		sleep 0.1;
		[] execVM "SIDEscripts\SIDEstart.sqf";
		sleep 0.1;
		// [] execVM "TacAds\jetpatrolinit.sqf";
		// sleep 0.1;
		[] execVM "Patrols\init.sqf";
		sleep 0.1;
    };
};

// ======================== TF47 Stuff ===================================

[] call tf47_core_umenu_ft_fnc_enableMenu;
diag_log "U-Menu enabled!";
waitUntil { isServer || !isNull player };
cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
private "_pathToScripts";
_pathToScripts = "tf47CoreScripts\";
call cfgTF47;

tf47_fnc_vehicleOnEnter     = compileFinal preprocessFileLineNumbers format ["%1vehicleOnEnter.sqf", _pathToScripts];
tf47_fnc_unitMarkerInit     = compileFinal preprocessFileLineNumbers format ["%1unitMarkerInit.sqf", _pathToScripts];
tf47_fnc_vehicleOnSpawn     = compileFinal preprocessFileLineNumbers format ["%1vehicleOnSpawn.sqf", _pathToScripts];

//"rot_trans_spawn_mark_1" setMarkerText format ["%1playerEvents.sqf", _pathToScripts];;

// client event handler
diag_log "Player Events init";
execVM format ["%1playerEvents.sqf", _pathToScripts];

// DB Functionality & Ticket System
diag_log "Database and Ticket init";
execVM format ["%1serverEvents.sqf", _pathToScripts];

// Special Markers
diag_log "Mapmarkers init";
execVM format ["%1mapMarkerInit.sqf", _pathToScripts];


sleep 0.5;

//start cleanup script
diag_log "Clean up init";
[] spawn tf47_fnc_cleanup_init;
sleep 0.1;

// Vehicle replacement
diag_log "Vehicle Replacement init";
vehiclespawnscript = [] execVM "vehiclereplacement.sqf";
sleep 0.1;
//No Bushes
diag_log "Bushdelete init";
nobushesscript = [] execVM "BASE\nobushes.sqf";
sleep 0.1;