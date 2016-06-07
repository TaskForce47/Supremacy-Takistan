_veh = _this select 0;	
_veh setVariable ["loadoutName", "Anti Tank Loadout", true];
//Clear Cargo
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;


_veh addItemCargoGlobal ["ACE_EarPlugs",4];
_veh addWeaponCargoGlobal ["ACE_Vector",2];
_veh addWeaponCargoGlobal ["Binocular",2];
_veh addMagazineCargoGlobal ["SmokeShellGreen",5];
_veh addMagazineCargoGlobal ["SmokeShellRed",5];
_veh addMagazineCargoGlobal ["SmokeShell",10];  
_veh addMagazineCargoGlobal["Medikit",1];

// Weapons + Ammo
switch (tf47_param_vehiclemod) do { 
	// Vanilla
	case 0 : { 
		_veh addWeaponCargoGlobal ["arifle_MX_F",3];
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",20];
		_veh addWeaponCargoGlobal ["launch_B_Titan_short_F", 1]; 
		_veh addMagazineCargoGlobal ["Titan_AT",3];
		_veh addMagazineCargoGlobal ["Titan_AP",2];
		_veh addWeaponCargoGlobal ["launch_NLAW_F",4];
		_veh addMagazineCargoGlobal ["Titan_AA",3];    
		_veh addWeaponCargoGlobal ["launch_B_Titan_F",1];  
	}; 
	// CUP
	case 1 : { 
		_veh addWeaponCargoGlobal ["CUP_arifle_M4A1_black",3];
		_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag",20];
		_veh addWeaponCargoGlobal ["CUP_Javelin", 1]; 
		_veh addMagazineCargoGlobal ["CUP_Javelin_M",2];
		_veh addMagazineCargoGlobal ["tf47_m3maaws_HE",5];
		_veh addMagazineCargoGlobal ["tf47_m3maaws_HEAT",5];
		_veh addWeaponCargoGlobal ["tf47_m3maaws",1];
		_veh addWeaponCargoGlobal ["tf47_at4_heat",4];
		_veh addMagazineCargoGlobal ["CUP_Stinger_M",3];    
		_veh addWeaponCargoGlobal ["CUP_launch_FIM92Stinger",1];  
	}; 	
	// RHS
	case 2 : { 
		_veh addWeaponCargoGlobal ["rhs_weap_m4_carryhandle",3];
		_veh addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag",20];
		_veh addWeaponCargoGlobal ["rhs_weap_fim92", 1]; 
		_veh addMagazineCargoGlobal ["rhs_fim92_mag",2];
		_veh addMagazineCargoGlobal ["tf47_m3maaws_heat", 8];
		_veh addMagazineCargoGlobal ["tf47_m3maaws_he", 2];
		_veh addWeaponCargoGlobal ["tf47_m3_maaws",1];
		_veh addItemCargoGlobal ["tf47_optic_m3maaws", 2];
		_veh addWeaponCargoGlobal ["tf47_at4_heat",4]; 
	}; 
};
