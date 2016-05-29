_veh = _this select 0;	
_veh setVariable ["loadoutName", "Medical Loadout", true];
//Clear Cargo
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;	

//Medic
_veh addItemCargoGlobal ["ACE_fieldDressing",15];
_veh addItemCargoGlobal ["ACE_elasticBandage",15];
_veh addItemCargoGlobal ["ACE_quikclot",15];
_veh addItemCargoGlobal ["ACE_tourniquet",8];
_veh addItemCargoGlobal ["ACE_personalAidKit",10];
_veh addItemCargoGlobal ["ACE_packingBandage",15];
_veh addItemCargoGlobal ["ACE_bloodIV",15];
_veh addItemCargoGlobal ["ACE_plasmaIV",15];
_veh addItemCargoGlobal ["ACE_salineIV",15];
_veh addItemCargoGlobal ["ACE_bloodIV_500",15];
_veh addItemCargoGlobal ["ACE_plasmaIV_500",15];
_veh addItemCargoGlobal ["ACE_salineIV_500",15];
_veh addItemCargoGlobal ["ACE_bloodIV_250",15];
_veh addItemCargoGlobal ["ACE_plasmaIV_250",15];
_veh addItemCargoGlobal ["ACE_salineIV_250",15];
_veh addItemCargoGlobal ["TF47_firstAidKit",10;
//Injectors
_veh addItemCargoGlobal ["ACE_morphine",10];
_veh addItemCargoGlobal ["ACE_atropine",10];
_veh addItemCargoGlobal ["ACE_epinephrine",10];
_veh addMagazineCargoGlobal ["SmokeShell",20];
_veh addMagazineCargoGlobal ["SmokeShellGreen",10];
_veh addMagazineCargoGlobal ["SmokeShellRed",10];
_veh addMagazineCargoGlobal ["SmokeShellBLue",5];

_veh addBackpackCargoGlobal ["BIS_Steerable_Parachute",10];

// Radios
switch (f_var_radios) do {
	// ACRE 2
		_veh addWeaponCargoGlobal ["ACRE_PRC117F",1];
	};
	// TFR
	case 2: {
		_veh addWeaponCargoGlobal ["tf_rt1523g",1];
	};
};


