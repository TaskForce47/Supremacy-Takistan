_veh = _this select 0;
_veh setVariable ["loadoutName", "Infantry Loadout", true];
//Clear Cargo
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

//Medic
_veh addItemCargoGlobal ["ACE_fieldDressing",10];
_veh addItemCargoGlobal ["ACE_packingBandage",10];
_veh addItemCargoGlobal ["ACE_elasticBandage",10];
_veh addItemCargoGlobal ["ACE_salineIV_500",4];
_veh addItemCargoGlobal ["ACE_tourniquet", 4];
_veh addItemCargoGlobal ["ACE_morphine",5];
_veh addItemCargoGlobal ["ACE_epinephrine",5];

//Grenades
_veh addMagazineCargoGlobal ["SmokeShell",8];
_veh addMagazineCargoGlobal ["SmokeShellGreen",3];
_veh addMagazineCargoGlobal ["SmokeShellRed",3];
_veh addMagazineCargoGlobal ["SmokeShellBLue",2];

_veh addItemCargoGlobal ["ItemRadio",2];
_veh addItemCargoGlobal ["ACE_Flashlight_XL50",4];

_veh addWeaponCargoGlobal ["ACE_Vector",1];
_veh addItemCargoGlobal ["B_UavTerminal",1];

_veh addBackpackCargoGlobal ["BIS_Steerable_Parachute",10];

switch (tf47_param_vehiclemod) do { 
	// Vanilla
	case 0 : { 
		// Items
		_veh addItemCargoGlobal ["NVGoggles",4];
		// Weapons
		_veh addWeaponCargoGlobal ["arifle_MX_F",2];
		_veh addWeaponCargoGlobal ["arifle_MXC_F",1];
		_veh addWeaponCargoGlobal ["arifle_MX_GL_F",1];
		
		// Ammo
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",30];
		_veh addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell",12];
		_veh addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",8];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",8];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",4];
		
		// Attachments
		_veh addItemCargoGlobal ["optic_Holosight",2];
		_veh addItemCargoGlobal ["optic_MRCO",2];
		_veh addItemCargoGlobal ["muzzle_snds_H",4];
		_veh addItemCargoGlobal ["acc_pointer_IR",4];
		
		// Launcher
		_veh addWeaponCargoGlobal ["launch_NLAW_F",3];
		
		// LMG
		_veh addWeaponCargoGlobal ["LMG_Mk200_F",1];
		_veh addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer",4];
	}; 
	// CUP
	case 1 : { 
		// Items
		_veh addItemCargoGlobal ["CUP_NVG_PVS7",4];
		// Weapons
		_veh addWeaponCargoGlobal ["CUP_arifle_M4A1_black",2];
		_veh addWeaponCargoGlobal ["CUP_arifle_M16A4_Base",1];
		_veh addWeaponCargoGlobal ["CUP_arifle_M16A4_GL",1];

		// Ammo
		_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag",30];
		_veh addMagazineCargoGlobal ["CUP_1Rnd_HE_M203",12];
		_veh addMagazineCargoGlobal ["CUP_1Rnd_Smoke_M203",8];
		_veh addMagazineCargoGlobal ["CUP_1Rnd_SmokeGreen_M203",8];
		_veh addMagazineCargoGlobal ["CUP_1Rnd_SmokeRed_M203",4];
		
		// Attachments
		_veh addItemCargoGlobal ["CUP_optic_HoloBlack",2];
		_veh addItemCargoGlobal ["CUP_optic_ACOG",2];
		_veh addItemCargoGlobal ["CUP_muzzle_snds_M16",4];
		_veh addItemCargoGlobal ["CUP_acc_ANPEQ_2",4];
		
		// Launcher
		_veh addWeaponCargoGlobal ["tf47_at4_heat",3];
		
		// LMG
		_veh addWeaponCargoGlobal ["CUP_lmg_M249_para",1];
		_veh addMagazineCargoGlobal ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",4];

	}; 	
	// RHS
	case 2 : { 
		//Items
		_veh addItemCargoGlobal ["ACE_NVG_Gen1",4];
		// Weapons
		_veh addWeaponCargoGlobal ["rhs_weap_m4a1_carryhandle",2];
		_veh addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle",1];
		_veh addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle_M203",1];

		// Ammo
		_veh addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag",30];
		_veh addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",12];
		_veh addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",8];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",8];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",4];
		
		// Attachments
		_veh addItemCargoGlobal ["rhsusf_acc_eotech_552",2];
		_veh addItemCargoGlobal ["rhsusf_acc_ACOG_USMC",2];
		_veh addItemCargoGlobal ["rhsusf_acc_anpeq15",4];
		
		// Launcher
		_veh addWeaponCargoGlobal ["tf47_at4_heat",3];
		
		// LMG
		_veh addWeaponCargoGlobal ["rhs_weap_m249_pip_L",1];
		_veh addMagazineCargoGlobal ["rhs_200rnd_556x45_T_SAW",4];

	}; 
};
