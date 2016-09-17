// --- TICKET SYSTEM & LOGGING ----------------------------------------------------------------------------------------------------------------------
// Modify this value to change the initial ticket count.
#define ACE3    0
#define ACRE    0
 
TICKETS_WEST = 100;
 
// Max Tickets the Team may ever have - tickets gained beyond that point are lost
TICKETS_SOFTCAP = 100;
TICKETS_HARDCAP = 150;
 
// This is the Mission ID for the Database Log - set to 0 to disable DB Logging
// 0 ... disabled
// 1 ... Takistan Domination
// 2 ... Fallujah Insurgency
// 3 ... Reshmaan Patrol Ops
// 4 ... Takistan Domination Mod Version
// 5 ... Takistan Domination Gefechtsübungszentrum (GUeZ) Version
// 7 ... ISLA DI CAPRAIA PatrolOps Mod
// 9 ... Invade&Annex Al Rayak
// 7 ... I&A Altis
// 93 ...Insurgency Kunduz
// 94...Operation Solve Conflict {Domination 2.0}
// 99... Development Server
TF47_MISSIONID = 94;
 
// Mission Name/Version Info for Log
TF47_MISSIONINFO = "SUPREMACY";
 
_pathtoscripts = "tf47CoreScripts\";
 
// _infantryStaminaClass = "US_Delta_Force_EP1";
 
// --- DESPAWN PREVENTION MARKERS -------------------------------------------------------------------------------------------------------------------
_despawnPreventionMarkers = [
        ["respawn_west","respawn_west_1",250]
];
 
// --- BASE CLEAN-UP MARKERS ------------------------------------------------------------------------------------------------------------------------
// see basecleanup.sqf for details
// Markers to Check for Base Clean-up Process
// [Marker Name, Clean-up Distance]
_baseCleanupMarkers = [["respawn_west","respawn_west_1",200]];
 
 
 
// --- MAP CONTROL MARKERS --------------------------------------------------------------------------------------------------------------------------
//              see mcmarker.sqf and mcmarkerchange.sqf for details
_statusMarkersInit = false;
_statusMarkerData = [
        ["UnitNATO_CO",      ["mc1marker",              "b_hq",         "ColorGreen",       "CCT - Command and Control ""GODFATHER""",true]],
        ["UnitNATO_DC",      ["mc2marker",              "b_hq",         "ColorGreen",       "CCT - Joint Terminal Attack Controller ""TOPMAN""",true]],
        ["UnitNATO_DC_D",    ["mc3marker",              "b_hq",         "ColorGreen",       "TOC - ""TOWER""",true]],
        ["evileye1",         ["callsign_evileye1",      "b_uav",        "ColorYellow",           "EVILEYE",     false]],
        ["raven1",           ["raven1marker",        "b_air",        "ColorBrown",           "RAVEN-01",     false]],
        ["raven2",           ["raven2marker",        "b_air",        "ColorBrown",           "MERLIN",     false]],
        ["dustoff",          ["dustoffmarker",       "b_air",        "ColorRED",           "DUSTOFF",     false]],
        ["butterfly1",       ["butterfly1marker",    "b_air",        "ColorBrown",           "BUTTERFLY-01", false]],
        ["butterfly2",       ["butterfly2marker",    "b_air",        "ColorBrown",           "BUTTERFLY-02", false]],
        ["pelican1",         ["pelican1marker",      "b_air",        "ColorBrown",           "PELICAN",      false]],
        ["griffin1",         ["griffin1marker",      "b_air",        "ColorBrown",           "CAT",   false]],
        ["goose1",           ["goose1marker",        "b_plane",      "ColorBrown",           "SEAGULL",        false]],
        ["manticore1",       ["manticore1marker",    "b_air",        "ColorOrange",          "MANTICORE",    false]],
        ["firefly1",         ["firefly1marker",      "b_air",        "ColorOrange",          "FIREFLY",      false]],
        ["thunderbird1",     ["thunderbirdmarker",  "b_plane",      "ColorOrange",          "THUNDERBIRD",  false]],
        ["wasp1",            ["wasp1marker",       	"b_plane",      "ColorOrange",          "WASP-01",    false]],
        ["eagle1",           ["eagle1marker",       	"b_plane",      "ColorOrange",          "EAGLE-01",    false]],
        ["albatros1",        ["albatros1marker",      "b_plane",      "ColorBrown",           "ALBATROS",     false]],
        ["rhino1",           ["rhino1marker",        "b_armor",      "ColorOrange",          "RHINO-01",     false]],
        ["rhino2",           ["rhino2marker",        "b_armor",      "ColorOrange",          "RHINO-02",     false]],
        ["lion1",            ["lion1marker",         "b_armor",      "ColorOrange",          "LION-01",      false]],
        ["lion2",            ["lion2marker",         "b_armor",      "ColorOrange",          "LION-02",      false]],
        ["frog1",            ["frog1marker",         "b_armor",      "ColorOrange",          "FROG-01",      false]],        
        /*
		["tiger1",           ["tiger1marker",        "b_mech_inf",   "ColorOrange",          "TIGER-01",     false]],
        ["tiger2",           ["tiger2marker",        "b_mech_inf",   "ColorOrange",          "TIGER-02",     false]],
        ["tiger3",           ["tiger3marker",        "b_mech_inf",   "ColorOrange",          "TIGER-03",     false]],
		*/
        ["gator1",           ["gator1marker",        "b_mech_inf",   "ColorOrange",          "SCORPION-01",     false]],
        ["gator2",           ["gator2marker",        "b_mech_inf",   "ColorOrange",          "SCORPION-02",     false]]
];
_statusMarkers = [_statusMarkerData, []] call CBA_fnc_hashCreate;
 
 
 
// --- LIFT RULES -----------------------------------------------------------------------------------------------------------------------------------
//              see vehicleOnSpawn.sqf
// _LiftHelicopters = ["seagull1","seagull2","pelican1"];
// _NoLiftHelicopters = ["crow1", "crow2", "dustoff1", "griffin1", "goose1", "manticore1"];
 
 
// --- No JUMP OUT VEH -----------------------------------------------------------------------------------------------------------------------------------
//              see vehicleOnEnter.sqf
_JumpOutHelicopters = [];
 
 
 
// --- VEHICLE RESTRICTIONS -------------------------------------------------------------------------------------------------------------------------
// ["Vehicle Name",Driver Whitelist ID (0 for None), Crew Whitelist ID (0 for None), ["Driver Slots"], ["Crew Slots"]
/*
Parameter Datatypes
Vehicle Name = "STRING"
Driver Whitelist ID  = 0 //(0 for None)
Crew Whitelist ID = 0 //(0 for None)
Driver Slots = ["UnitName"]
Crew Slots = ["Unitname"]
*/
_vehicleRestrictionData = [
        // Rotary Wing Attack 1 AH-6 Firefly
        ["firefly1",                       [1, 1,  ["UnitNATO_AH1_P","UnitNATO_AH1_CP"],                               ["UnitNATO_AH1_P","UnitNATO_AH1_CP"]]],
        // Rotary Wing Attack 2 AH 1 Z Manticore
        ["manticore1",                       [1, 1,  ["UnitNATO_AH1_P","UnitNATO_AH1_CP"],                               ["UnitNATO_AH1_P","UnitNATO_AH1_CP"]]],
        // Rotary Transport MH 6 Butterfly
        ["butterfly1",                      [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"]]],
        ["butterfly2",                      [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"]]],
        // Rotary Transport UH 1Y Griffin
        ["griffin1",                      [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"]]],
	// Rotary Transport UH 60 L Raven
        ["raven1",                          [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP","UnitNATO_TH1_G1","UnitNATO_TH1_G2","UnitNATO_TH2_G1","UnitNATO_TH2_G2"]]],
        ["raven2",                          [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP","UnitNATO_TH1_G1","UnitNATO_TH1_G2","UnitNATO_TH2_G1","UnitNATO_TH2_G2"]]],
        // Rotary Transport UH 60 M Dustoff
        ["dustoff",                          [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP","UnitNATO_TH1_G1","UnitNATO_TH1_G2","UnitNATO_TH2_G1","UnitNATO_TH2_G2"]]],
        // Rotary Transport CH 47 Pelican
        ["pelican1",                          [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP","UnitNATO_TH1_G1","UnitNATO_TH1_G2","UnitNATO_TH2_G1","UnitNATO_TH2_G2"]]],
        
        //FIXED WINGS
        // Fixed Wing Transport MV 22 Goose
        ["goose1",                          [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP","UnitNATO_TH1_G1","UnitNATO_TH1_G2","UnitNATO_TH2_G1","UnitNATO_TH2_G2"]]],
        // Fixed Wing Transport C130J Albatros
        ["albatros1",                       [1, 1,  ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP"],                 ["UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH2_P","UnitNATO_TH2_CP","UnitNATO_TH1_G1","UnitNATO_TH1_G2","UnitNATO_TH2_G1","UnitNATO_TH2_G2"]]],

        //Fixed Wing Attack Harrier AV8B GBU 12
        ["wasp1",                          [1, 1,  ["UnitNATO_AFW1_P","UnitNATO_AFW2_P","UnitNATO_AFW3_P","UnitNATO_AFW4_P"],                 []]],
        //Fixed Wing Attack Harrier AV8B AGM
        ["eagle1",                          [1, 1,  ["UnitNATO_AFW1_P","UnitNATO_AFW2_P","UnitNATO_AFW3_P","UnitNATO_AFW4_P"],                 ["UnitNATO_AFW1_P","UnitNATO_AFW2_P","UnitNATO_AFW3_P","UnitNATO_AFW4_P"]]],	
        //Fixed Wing Attack Thunderbird
        ["thunderbird1",                   [1, 1,  ["UnitNATO_AFW1_P","UnitNATO_AFW2_P","UnitNATO_AFW3_P","UnitNATO_AFW4_P"],                 []]],

        // Tank M1A1 Rhino
        ["rhino1",                     [2, 2,  ["UnitNATO_TNK1_C","UnitNATO_TNK1_D","UnitNATO_TNK1_G","UnitNATO_TNK2_C","UnitNATO_TNK2_D","UnitNATO_TNK2_G"],      ["UnitNATO_TNK1_C","UnitNATO_TNK1_D","UnitNATO_TNK1_G","UnitNATO_TNK2_C","UnitNATO_TNK2_D","UnitNATO_TNK2_G"]]],
        ["rhino2",                     [2, 2,  ["UnitNATO_TNK1_C","UnitNATO_TNK1_D","UnitNATO_TNK1_G","UnitNATO_TNK2_C","UnitNATO_TNK2_D","UnitNATO_TNK2_G"],      ["UnitNATO_TNK1_C","UnitNATO_TNK1_D","UnitNATO_TNK1_G","UnitNATO_TNK2_C","UnitNATO_TNK2_D","UnitNATO_TNK2_G"]]],
        // Tank M2A3 Lion
        ["lion1",                     [2, 2,   ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"],      ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"]]],
        ["lion2",                     [2, 2,   ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"],      ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"]]],
        // M6 Linebacker Frog
        ["frog1",                     [2, 2,   ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"],      ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"]]],
        // IFV M1126 ICV Tiger
        /*
		["tiger1",                     [2, 2,  ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"],      ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"]]],
        ["tiger2",                     [2, 2,  ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"],      ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"]]],
        ["tiger3",                     [2, 2,  ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"],      ["UnitNATO_IFV1_C","UnitNATO_IFV1_D","UnitNATO_IFV1_G","UnitNATO_IFV2_C","UnitNATO_IFV2_D","UnitNATO_IFV2_G"]]],
        */
		// LAV25 GATOR
        ["gator1",                     [2, 2,  ["arty1","arty2","arty3","arty4","arty5"],      ["arty1","arty2","arty3","arty4","arty5"]]],
        ["gator2",                     [2, 2,  ["arty1","arty2","arty3","arty4","arty5"],      ["arty1","arty2","arty3","arty4","arty5"]]],
        ["tochmmwv",                   [3, 0,  ["UnitNATO_CO","UnitNATO_DC"],      []]]

	// AW-159
        //["aw159",                     [1, 1,  ["b_29","b_30"],                               ["b_29","b_30"]]],
        // AH6
        //["ah6",                                       [1, 1,  ["rotwa21","rotwa22"],                                          ["rotwa21","rotwa22"]]],
        // A-10/F-16
        //["a10",                               [1, 1,  ["fixwa11","fixwa21"],                                          []]],
        // A-10/F-16
        //["f16",                               [1, 1,  ["fixwa11","fixwa21"],                                          []]],
        // MH-6
        //["mh6",                                       [1, 1,  ["rotwt31","rotwt32"],                                          ["rotwt31","rotwt32"]]],
        // CH-47
        //["ch47",                                      [1, 1,  ["rotwt21","rotwt22","rotwt23","rotwt24"],                                              ["rotwt21","rotwt22","rotwt23","rotwt24"]]],
        // C-130
        //["c130",                                      [1, 1,  ["fixwt11","fixwt12","fixwt13"],                        ["fixwt11","fixwt12","fixwt13"]]],
        // UH60M (DUSTOFF)
        //["dustoff",                   [1, 1,  ["rotwt41","rotwt42"],                      ["rotwt41"],["rotwt42"]]],
       
        
       
        // ["raven2",                   [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["pelican1",                 [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["griffin1",                 [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["griffin2",                 [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["butterfly1",               [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["butterfly2",               [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["c1301",                    [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
 
        // ["dragon1",          [1, 1,  ["rotwa11","rotwa12"],                                                                                                  ["rotwa11","rotwa12"]]]
        // ["firefly1",                 [1, 1,  ["rotatt21","rotatt22"],                                                                                                        ["rotatt21","rotatt22","rotatt23","rotatt24"]]],
 
        // ["thunderbird1",     [1, 1,  ["fixatt11","fixatt21","fixatt22","fixatt31"],                                                          []]],
        // ["falcon1",          [1, 1,  ["fixatt11","fixatt21","fixatt22","fixatt31"],                                                          []]],
        // ["falcon2",          [1, 1,  ["fixatt11","fixatt21","fixatt22","fixatt31"],                                                          ["fixatt22"]]],
        // ["rhino1",                   [2, 2,  ["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],      []]],
        // ["rhino2",                   [2, 2,  ["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],      []]],
        // ["tiger1",                   [2, 2,  ["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],      []]],
        // ["tiger2",                   [2, 2,  ["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],      []]]
];
_vehicleRestrictions = [_vehicleRestrictionData, []] call CBA_fnc_hashCreate;
 
 
 
// --- SECURE SLOTS ---------------------------------------------------------------------------------------------------------------------------------
// Slot Name, Whitelist ID
_secureSlots = [
        ["UnitNATO_CO", 3],		// CCT Command and Control
        ["UnitNATO_DC", 3],     // CCT  JTAC
		["UnitNATO_DC_D", 1],	// Tower 
		["MissionObserver", 5]	// Mission Observer
];
 
// --- ALL SLOTS ------------------------------------------------------------------------------------------------------------------------------------
// used by Domination for Playermarkers, etc...
_allslots = [];
 
// --- Infantry Ticket Costs ------------------------------------------------------------------------------------------------------------------------
// Infantry:                                            2 Tickets
// Infantry Squad Medics:                       		3 Tickets
// Infantry Fireteamleader								4 Tickets
// Infantry Squad Lead:                         		5 Tickets
// Infantry Platoon Lead								6 Tickets
// Tank Crew:                                           10 Tickets
// UH60 Crew:   				       					10 Tickets
// MH-6 Crew:                                           10 Tickets
// AH-6 Crew:         				    				10 Tickets
// Mission Control Slots:                       		15 Tickets
// Zeus Slot:                                           100 Tickets
 
_infantryTicketsDefault = 1;
_infantryLeadTicketsDefault = 2;
_MedicTicketsDefault = 3;
_tankcrewTicketsDefault = 4;
_pilotTicketsDefault = 5;
_infantryTicketsData = [

        // Platoon Lead
		["UnitNATO_CO",_infantryLeadTicketsDefault],	["UnitNATO_DC",_infantryLeadTicketsDefault],
        //Squad Lead
        ["UnitNATO_ASL_SL",_infantryLeadTicketsDefault],	["UnitNATO_BSL_SL",_infantryLeadTicketsDefault],	["UnitNATO_CSL_SL",_infantryLeadTicketsDefault],
		//Fireteam Lead
		      ["UnitNATO_A1_FTL",_infantryLeadTicketsDefault],  ["UnitNATO_A2_FTL",_infantryLeadTicketsDefault],  ["UnitNATO_A3_FTL",_infantryLeadTicketsDefault],  ["UnitNATO_B1_FTL",_infantryLeadTicketsDefault],  ["UnitNATO_B2_FTL",_infantryLeadTicketsDefault],  ["UnitNATO_B3_FTL",_infantryLeadTicketsDefault],  ["UnitNATO_C1_FTL",_infantryLeadTicketsDefault],	["UnitNATO_C4_FTL",_infantryLeadTicketsDefault],	["UnitNATO_C3_FTL",_infantryLeadTicketsDefault],   
        // Medics
        ["UnitNATO_ASL_M",_MedicTicketsDefault],	["UnitNATO_BSL_M",_MedicTicketsDefault],	["UnitNATO_CSL_M",_MedicTicketsDefault],	["UnitNATO_CO_M",_MedicTicketsDefault],
	    // SPZ Crew
	    ["UnitNATO_TNK1_C", _tankcrewTicketsDefault],	["UnitNATO_TNK1_G", _tankcrewTicketsDefault],	["UnitNATO_TNK1_D", _tankcrewTicketsDefault],	["UnitNATO_IFV_C", _tankcrewTicketsDefault],	        ["UnitNATO_IFV_G", _tankcrewTicketsDefault],	        ["UnitNATO_IFV_D", _tankcrewTicketsDefault],
		
        // Transport Rotary Wing
        ["UnitNATO_TH1_P", _pilotTicketsDefault],         ["UnitNATO_TH1_CP", _pilotTicketsDefault],        ["UnitNATO_TH1_G1",_pilotTicketsDefault],          ["UnitNATO_TH1_G2",_pilotTicketsDefault],        ["UnitNATO_TH2_P", _pilotTicketsDefault],         ["UnitNATO_TH2_CP", _pilotTicketsDefault],         ["UnitNATO_TH2_G1",_pilotTicketsDefault],        ["UnitNATO_TH2_G2",_pilotTicketsDefault],
       
	// Attack Rotary Wing
        ["UnitNATO_AH1_P", _pilotTicketsDefault],            ["UnitNATO_AH1_CP", _pilotTicketsDefault],
	   
        // Fixed Wing
        ["UnitNATO_AFW1_P", _pilotTicketsDefault],	     ["UnitNATO_AFW2_P", _pilotTicketsDefault],      ["UnitNATO_AFW3_P", _pilotTicketsDefault],         ["UnitNATO_AFW4_P", _pilotTicketsDefault], 
       
        // CCT, JTAC, TOWER
        ["UnitNATO_DC_D", _infantryLeadTicketsDefault]
 
];
_infantryTickets = [_infantryTicketsData, _infantryTicketsDefault] call CBA_fnc_hashCreate;
 
// --- SatCon----------------------------------------------------------------------------------------------------------------------------------------
_satConSlotsData = [
        //["mc1",  true]
];
_satConSlots = [_satConSlotsData, false] call CBA_fnc_hashCreate;
 
// --- Active Mods ----------------------------------------------------------------------------------------------------------------------------------
_activeModsData = [
];
_activeMods = [_activeModsData, false] call CBA_fnc_hashCreate;
 
// --- Default Loadouts -----------------------------------------------------------------------------------------------------------------------------
_defaultLoadoutsData = [
/*
        ["armor11", "crew"],                    ["armor12", "crew"],                    ["armor13", "crew"],
        ["armor21", "crew"],                    ["armor22", "crew"],                    ["armor23", "crew"],
        ["rotwt11", "crew"],                    ["rotwt12", "crew"],                    ["rotwt13", "crew"],                    ["rotwt14", "crew"],            ["rotwt15", "crew"],
        ["rotwt21", "crew"],                    ["rotwt22", "crew"],                    ["rotwt23", "crew"],                    ["rotwt24", "crew"],            ["rotwt25", "crew"],
        ["rotwa11", "crew"],                    ["rotwa12", "crew"],
        ["fixwa11", "crew"],                    ["fixwa12", "crew"],                    ["fixwa13", 10],
        ["maceact", "squadleader"],     ["mace11", "squadleader"],              ["mace21", "squadleader"],              ["mace31", "squadleader"],
        ["hammeract", "squadleader"],   ["hammer11", "squadleader"],    ["hammer21", "squadleader"],    ["hammer31", "squadleader"],
        ["mace12", "medic"],                    ["mace22", "medic"],                    ["mace32", "medic"],
        ["hammer12", "medic"],                  ["hammer22", "medic"],                  ["hammer32", "medic"],
        ["mc1", "cct"],                                 ["mc2", "cct"],                                 ["mc3", "cct"],                                 ["mc4", "cct"],                                 ["mc5", "cct"]
*/
];
_defaultLoadouts = [_defaultLoadoutsData, "basic"] call CBA_fnc_hashCreate;