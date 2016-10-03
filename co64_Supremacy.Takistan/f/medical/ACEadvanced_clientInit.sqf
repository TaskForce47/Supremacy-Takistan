// F3 - ACE Advanced Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private ["_typeOfUnit"];

_typeOfUnit = player getVariable "f_var_assignGear";


// Remove pre-assigned medical items
{player removeItems _x} forEach ["ACE_Maptools","ACE_IR_Strobe_Item","ACE_CableTie","ACE_Flashlight_XL50","ACE_EarPlugs","ACE_personalAidKit","ACE_tourniquet","ACE_elasticBandage","ACE_adenosine","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_packingBandage","ACE_fieldDressing","ACE_salineIV_250","ACE_quikclot","ACE_surgicalKit","ACE_salineIV_500"];

// Add basic items to all units in 3 Line System
player addItemToUniform "ACE_EarPlugs";
{player addItemToUniform "ACE_tourniquet"} forEach [1,2];
{player addItemToUniform "ACE_morphine"} forEach [1,2];
{player addItemToUniform "ACE_epinephrine"} forEach [1,2];
{player addItemToUniform "ACE_quikclot"} forEach [1,2,3,4,5];
{player addItemToUniform "ACE_elasticBandage"} forEach [1,2,3,4,5,6,7,8,9,10];
{player addItemToUniform "ACE_packingBandage"} forEach [1,2,3,4,5,6,7,8,9,10];
player addItemToUniform "ACE_salineIV_250";
player addItemtoUniform "ACE_Maptools"; 	// Add Maptools
player addItemtoUniform "ACE_IR_Strobe_Item"; // Add IR Strobe
player addItemtoUniform "ACE_CableTie"; // Add Cable Ties
player addItemToUniform "ACE_Flashlight_XL50"; // Add ACE Flashlights
// Vest
// player addItemToVest "TF47_firstAidKit"; // add this one to Vest

if (_typeOfUnit == "m") then
{
	player setVariable ["Ace_medical_medicClass", 2,true];
	// BACKPACK: LIGHT
	if (f_param_backpacks == 0) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_elasticBandage",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_packingBandage",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_tourniquet ",  2];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 5];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   5];
		(unitBackpack player) addItemCargoGlobal ["ACE_atropine",   2];
		(unitBackpack player) addItemCargoGlobal ["ACE_surgicalKit", 1];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_500", 4];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks >= 1) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_elasticBandage",  24];
		(unitBackpack player) addItemCargoGlobal ["ACE_packingBandage",  24];
		(unitBackpack player) addItemCargoGlobal ["ACE_tourniquet ",  5];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 15];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   15];
		(unitBackpack player) addItemCargoGlobal ["ACE_adenosine",   4];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_500", 10];
		(unitBackpack player) addItemCargoGlobal ["ACE_surgicalKit", 1];
		// (unitBackpack player) addItemCargoGlobal ["TF47_firstAidKit", 2];
	};
};
if (_typeOfUnit == "cfr") then
{
	player setVariable ["Ace_medical_medicClass", 1,true];
	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_elasticBandage",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_packingBandage",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_tourniquet ",  2];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 5];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   5];
		(unitBackpack player) addItemCargoGlobal ["ACE_atropine",   2];
		(unitBackpack player) addItemCargoGlobal ["ACE_surgicalKit", 1];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_250", 4];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_elasticBandage",  24];
		(unitBackpack player) addItemCargoGlobal ["ACE_packingBandage",  24];
		(unitBackpack player) addItemCargoGlobal ["ACE_tourniquet ",  6];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 10];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   10];
		(unitBackpack player) addItemCargoGlobal ["ACE_adenosine",   4];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_500", 5];
		(unitBackpack player) addItemCargoGlobal ["ACE_surgicalKit", 1];
		// (unitBackpack player) addItemCargoGlobal ["TF47_FirstAidKit", 2];
	};
};


