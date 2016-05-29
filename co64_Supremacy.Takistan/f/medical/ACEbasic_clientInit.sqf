// F3 - ACE 3 Basic Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private ["_typeOfUnit","_unit"];

_typeOfUnit = player getVariable "f_var_assignGear";
_unit = this select 0;
// Remove pre-assigned medical items
{player removeItems _x} forEach ["ACE_Maptools","ACE_IR_Strobe_Item","ACE_CableTie","ACE_Flashlight_XL50","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_bloodIV"];

// Add basic items to all units
player addItem "ACE_EarPlugs";
{player addItem "ACE_fieldDressing"} forEach [1,2,3,4,5,6,7,9,10];
player addItem "ACE_morphine";
player addItemtoUniform "ACE_Maptools"; 	// Add Maptools
player addItemtoUniform "ACE_IR_Strobe_Item"; // Add IR Strobe
player addItemtoUniform "ACE_CableTie"; // Add Cable Ties
player addItemToUniform "ACE_Flashlight_XL50"; // Add ACE Flashlights

if (_typeOfUnit == "m") then
{
	_unit setVariable ["Ace_medical_medicClass", 1, true];
	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 10];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   10];
		(unitBackpack player) addItemCargoGlobal ["ACE_BloodIV_500", 3];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  30];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 20];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   20];
		(unitBackpack player) addItemCargoGlobal ["ACE_BloodIV", 6];
	};
};
if (_typeOfUnit == "cfr") then
{
	_unit setVariable ["Ace_medical_medicClass", 1, true];
	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 10];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   10];
		(unitBackpack player) addItemCargoGlobal ["ACE_BloodIV_500", 3];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  30];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 20];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   20];
		(unitBackpack player) addItemCargoGlobal ["ACE_BloodIV", 6];
	};
};
