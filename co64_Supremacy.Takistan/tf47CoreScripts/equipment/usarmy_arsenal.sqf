private ["_arsenal","_unit","_id","_inventory","_backpacks","_items","_mod_items","_radioitems","_magazines","_weapons","_mod_backpacks","_mod_magazines","_mod_weapons","_backpack_radios","_items_radios"];
params ["_arsenal","_unit","_id"];

waitUntil {!isNil "f_param_uniforms" && !isNil "f_var_radios"};

switch (f_param_uniforms) do {
	case 1 : {
		// RHS & 3CB
		#include "rhs_usarmy_arsenal.sqf"
	}; 
	case 2 : {  
		// RHS
		#include "rhs_usarmy_arsenal.sqf"
	}; 
	case 3 : {  
		// CUP
		#include "cup_arsenal.sqf"
	}; 
	case 4 : {  
		// CUP & USM
		#include "cup_usm_arsenal.sqf"
	}; 
	default {  
		// Vanilla
		#include "vanilla_arsenal.sqf"
	}; 
};
switch (f_var_radios) do {
	case 1 : {  
		// ACRE 2
		#include "acre2.sqf"
	}; 
	case 2 : {  
		// TFAR
		#include "t_far.sqf"
	}; 
	default {  
		// Vanilla
		#include "vanilla_radio.sqf"
	};
};
// include ACE 3 Stuff
#include "ace_arsenal.sqf" 


_weapons = _mod_weapons + _ace_weapons;
_magazines = _mod_magazines + _ace_magazines;
_backpacks = _mod_backpacks + _ace_backpacks + _backpack_radios;
_items = _mod_items + _ace_items + _items_radios;

// Check if @XLA_FixedArsenal is loaded
if (isnil "XLA_fnc_addVirtualItemCargo") then {
    hint "@XLA_FixedArsenal not found.";
} else {    
	[_arsenal, _items, true, false] call XLA_fnc_addVirtualItemCargo; 
    [_arsenal, _weapons, true, false] call XLA_fnc_addVirtualWeaponCargo; 
	[_arsenal, _backpacks, true, false] call XLA_fnc_addVirtualBackpackCargo; 
    [_arsenal, _magazines, true, false] call XLA_fnc_addVirtualMagazineCargo; 
        
    // Start the arsenal on it
    ["AmmoboxInit",[_arsenal,false,{true},"<t color='#166B11'>US Army",false]] spawn XLA_fnc_arsenal;
};
