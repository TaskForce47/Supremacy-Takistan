	private ["_object","_type","_pos_x","_pos_y","_pos_z"];
	_object = _this select 0;
	_type = _this select 1;
	_pos_x = getPos _object select 0;
	_pos_y = getPos _object select 1;
	_pos_z = getPos _object select 2;

if (isNil{_type}) then {} else {

    //prevent cleaning from cleanup script 
    _object setVariable ["pvpfw_cleanUp_keep", true , true];

	switch (_type) do { 
			case "chair" : {
					[_object,false] call ace_dragging_fnc_setCarryable; 
			}; 
			case "guard" : {
	waitUntil {	_object getVariable ["f_var_assignGear_done", true];};
					_object addAction ["<t color='#990000'>Please equip me fast!</t>","[player] execVM 'tf47CoreScripts\equipment\fastequipment.sqf';",nil,1,true,false];
				    _object disableAI "MOVE";
				    _object disableAI "COVER";
				    _object disableAI "AUTOTARGET";
				    _object setUnitPos "up";
				    _object allowDamage false;
				    removeBackpack _object;
				    removeAllWeapons _object;
			};
			case "box" : {
					_object setVariable ["ace_cargo_size", -1];
					_object allowDamage false;
			};
			case "table_usmc" : { 	
					arsenal = [_object] execVM "tf47CoreScripts\equipment\usmc_arsenal.sqf";
					_object allowDamage false;
					_object enableSimulationGlobal false;
			};
			case "table_baf" : { 	
					arsenal = [_object] execVM "tf47CoreScripts\equipment\baf_arsenal.sqf";
					_object allowDamage false;
					_object enableSimulationGlobal false;
			};
			case "table_usarmy" : { 	
					arsenal = [_object] execVM "tf47CoreScripts\equipment\usarmy_arsenal.sqf";
					_object allowDamage false;
					_object enableSimulationGlobal false;
			};
			case "levelphone" : {
					_object setPos [_pos_x,_pos_y,_pos_z+0.86];
					_object allowDamage false;
					_object enableSimulationGlobal false;
			};
			case "tent" : {
					_object allowDamage false;
					_object enableSimulationGlobal false;
			};
			case "radiobox" : {
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				clearItemCargoGlobal _object;
				_object allowDamage false;
				waitUntil {!isNil "f_var_radios"};
				[_object] spawn {
					while{true} do {
						_object = _this select 0;
							if (f_var_radios == 1) then {
					        // ACRE 2
					        _object addItemCargoGlobal ["ACRE_PRC343", 100];
					        _object addItemCargoGlobal ["ACRE_PRC148", 100];
					        _object addItemCargoGlobal ["ACRE_PRC152", 100];
					        _object addItemCargoGlobal ["ACRE_PRC117F", 100];
							}; 
					    	if (f_var_radios == 2) then {  
					    	    // TFAR
					    	    _object addItemCargoGlobal ["tf_anprc152", 100];
					    	    _object addItemCargoGlobal ["tf_rf7800str", 100];
					    	    _object addItemCargoGlobal ["tf_microdagr", 100];
					    	    _object addItemCargoGlobal ["tf_rt1523g_sage", 100];
					    	    _object addItemCargoGlobal ["tf_rt1523g", 100];
					    	}; 
					    	if (f_var_radios ==  0) then {  
					    	    // Vanilla
					    	    _object addItemCargoGlobal ["ItemRadio", 100];
					    	};
					    	if (f_var_debugMode == 1) then {
					    	[ "Radios added to radiobox", "cba_network", [true, true, true] ] call CBA_fnc_debug;
					    	};
					    	sleep 5000;
					};
				};
			};
			case "medictrunk" : {
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				clearItemCargoGlobal _object;
				_object allowDamage false;
				[_object] spawn {
					while{true} do {
						_object = _this select 0;
						clearItemCargoGlobal _object;
						_object addItemCargoGlobal ["ACE_bodyBag",50];
						_object addItemCargoGlobal ["ACE_surgicalKit",50];
						_object addItemCargoGlobal ["ACE_personalAidKit",50];
						_object addItemCargoGlobal ["ACE_quikclot",50];
						_object addItemCargoGlobal ["ACE_salineIV_250",50];
						_object addItemCargoGlobal ["ACE_salineIV_500",50];
						_object addItemCargoGlobal ["ACE_salineIV",50];
						_object addItemCargoGlobal ["ACE_bloodIV_250",50];
						_object addItemCargoGlobal ["ACE_bloodIV_500",50];
						_object addItemCargoGlobal ["ACE_bloodIV",50];
						_object addItemCargoGlobal ["ACE_plasmaIV_250",50];
						_object addItemCargoGlobal ["ACE_plasmaIV_500",50];
						_object addItemCargoGlobal ["ACE_plasmaIV",50];
						_object addItemCargoGlobal ["ACE_epinephrine",50];
						_object addItemCargoGlobal ["ACE_atropine",50];
						_object addItemCargoGlobal ["ACE_adenosine",50];
						_object addItemCargoGlobal ["ACE_morphine",50];
						_object addItemCargoGlobal ["ACE_tourniquet",50];
						_object addItemCargoGlobal ["ACE_elasticBandage",50];
						_object addItemCargoGlobal ["ACE_packingBandage",50];
						_object addItemCargoGlobal ["ACE_fieldDressing",50];
						_object addItemCargoGlobal ["TF47_firstAidKit",50];
						sleep 3600;
						if (f_var_debugMode == 1) then {
						 	[ "Medical Items added to Medical Trunk", "cba_network", [true, true, true] ] call CBA_fnc_debug;
						 };
					};
				};
			};
			case "mortarbox" : {
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				clearItemCargoGlobal _object;
				_object allowDamage false;
				[_object] spawn {
					while{true} do {
						_object = _this select 0;
						clearWeaponCargoGlobal _object;
						clearMagazineCargoGlobal _object;
						clearItemCargoGlobal _object;
						clearBackpackCargoGlobal _object;
						_object addBackpackCargoGlobal ["B_Mortar_01_weapon_F",1];
						_object addBackpackCargoGlobal ["B_Mortar_01_support_F",1];
						_object addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE",20];
						_object addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Smoke",20];
						_object addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Illum",20];
						_object addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE_Guided",20];
						_object addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE_LaserGuided",20];
						_object addItemCargoGlobal ["ACE_MapTools",10];
						_object addItemCargoGlobal ["ACE_RangeTable_82mm",10];
						_object addItemCargoGlobal ["ACE_microDAGR",10];
						_object addItemCargoGlobal ["ACE_RangeCard",10];
						_object addItemCargoGlobal ["ACE_Vector",10];
						sleep 7200;
					};
				};
			};
		default { _object enableSimulationGlobal false;}; 
		};
	};