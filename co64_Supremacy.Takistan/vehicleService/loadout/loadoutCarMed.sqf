_veh = _this select 0;	
_veh setVariable ["loadoutName", "Medical Loadout", true];
//Clear Cargo
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;	

//Medic
_veh addItemCargoGlobal ["ACE_fieldDressing",50];
_veh addItemCargoGlobal ["ACE_elasticBandage",50];
_veh addItemCargoGlobal ["ACE_quikclot",100];
_veh addItemCargoGlobal ["ACE_tourniquet",20];
_veh addItemCargoGlobal ["ACE_personalAidKit",50];
_veh addItemCargoGlobal ["ACE_packingBandage",50];
_veh addItemCargoGlobal ["ACE_bloodIV",50];
_veh addItemCargoGlobal ["ACE_plasmaIV",50];
_veh addItemCargoGlobal ["ACE_salineIV",50];
_veh addItemCargoGlobal ["ACE_bloodIV_500",25];
_veh addItemCargoGlobal ["ACE_plasmaIV_500",25];
_veh addItemCargoGlobal ["ACE_salineIV_500",25];
_veh addItemCargoGlobal ["ACE_bloodIV_250",25];
_veh addItemCargoGlobal ["ACE_plasmaIV_250",25];
_veh addItemCargoGlobal ["ACE_salineIV_250",25];
// _veh addItemCargoGlobal ["TF47_firstAidKit",10;
//Injectors
_veh addItemCargoGlobal ["ACE_morphine",50];
_veh addItemCargoGlobal ["ACE_atropine",50];
_veh addItemCargoGlobal ["ACE_epinephrine",50];
_veh addMagazineCargoGlobal ["SmokeShell",20];
_veh addMagazineCargoGlobal ["SmokeShellGreen",10];
_veh addMagazineCargoGlobal ["SmokeShellRed",10];
_veh addMagazineCargoGlobal ["SmokeShellBLue",5];

// Radios
switch (f_var_radios) do {
	case 1: {
	// ACRE 2
		_veh addWeaponCargoGlobal ["ACRE_PRC117F",1];
	};
	// TFR
	case 2: {
		_veh addBackpackCargoGlobal ["tf_rt1523g",1];
	};
};


