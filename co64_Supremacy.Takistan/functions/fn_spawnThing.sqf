params ["_object","_player","_id","_array"];
_type = _array select 0;
_special = _array select 1;

hint format ["%1",_special];

_objectPos = getPos _object;
_objectDir = (getDir _object) - 100;
_thingPos = [(_objectPos select 0) + sin(_objectDir)*1.5,(_objectPos select 1) + cos(_objectDir)*1.5];

// check if there isn't already a thing
_near = _thingPos nearObjects ["thingX", 2];
if(count _near > 0) then {
	{
		deleteVehicle _x;
	} forEach _near;
};

// spawn the thing
_thing = _type createVehicle [0,0,1];
_thing enableSimulationGlobal false;
_thing setPos _thingPos;
_thing setDir (_objectDir - 100 + random 40);
sleep 0.5;
_thing enableSimulationGlobal true;

//dependent on RHS ATM
if (_special == "weaponBox") then
{
	clearItemCargoGlobal _thing;
	clearWeaponCargoGlobal _thing;
	clearMagazineCargoGlobal _thing;
	clearBackpackCargoGlobal _thing;

	switch (tf47_param_vehiclemod) do { 
	// RHS
	case 2 : {
		_thing addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle", 2];
		_thing addWeaponCargoGlobal ["rhs_weap_m4_carryhandle", 2];
		_thing addWeaponCargoGlobal ["rhs_weap_m4a1_carryhandle_m203", 1];
		_thing addWeaponCargoGlobal ["rhs_weap_m249_pip_L", 1];
		_thing addWeaponCargoGlobal ["rhs_weap_m240B", 1];
		_thing addWeaponCargoGlobal ["rhsusf_weap_m1911a1", 2];

		_thing addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 15];
		_thing addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 3];
		_thing addMagazineCargoGlobal ["rhs_200rnd_556x45_B_SAW", 6];
		_thing addMagazineCargoGlobal ["rhs_mag_M441_HE", 10];
		_thing addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP", 4];

		_thing addItemCargoGlobal ["rhsusf_acc_ACOG2_USMC", 2];
		_thing addItemCargoGlobal ["rhsusf_acc_eotech_552", 3];
		_thing addItemCargoGlobal ["rhsusf_acc_compm4", 3];
		};
	};
};

if (_special == "ATBox") then
{
	clearItemCargoGlobal _thing;
	clearWeaponCargoGlobal _thing;
	clearMagazineCargoGlobal _thing;
	clearBackpackCargoGlobal _thing;

	_thing addWeaponCargoGlobal ["tf47_m3maaws", 2];
	_thing addWeaponCargoGlobal ["tf47_at4_heat", 2];

	_thing addMagazineCargoGlobal ["tf47_m3maaws_heat", 8];
	_thing addMagazineCargoGlobal ["tf47_m3maaws_he", 2];

	_thing addItemCargoGlobal ["tf47_optic_m3maaws", 2];
};

if (_special == "AABox") then
{
	clearItemCargoGlobal _thing;
	clearWeaponCargoGlobal _thing;
	clearMagazineCargoGlobal _thing;
	clearBackpackCargoGlobal _thing;

	switch (tf47_param_vehiclemod) do { 
	// RHS
	case 2 : {
		_thing addWeaponCargoGlobal ["rhs_weap_fim92", 2];

		_thing addMagazineCargoGlobal ["rhs_fim92_mag", 10];

		_thing addItemCargoGlobal ["ACE_banana", 2];
		};
	};
};

if (_special == "AmmoBox") then
{
	clearItemCargoGlobal _thing;
	clearWeaponCargoGlobal _thing;
	clearMagazineCargoGlobal _thing;
	clearBackpackCargoGlobal _thing;

	switch (tf47_param_vehiclemod) do { 
	// RHS
	case 2 : {
		_thing addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 25];
		_thing addMagazineCargoGlobal ["rhs_200rnd_556x45_B_SAW", 15];	
		_thing addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 10];
		_thing addMagazineCargoGlobal ["rhs_mag_M441_HE", 20];
		_thing addMagazineCargoGlobal ["rhs_mag_m67", 8];
		_thing addMagazineCargoGlobal ["rhs_mag_an_m8hc", 8];
		};
	};
};

if (_special == "emptyBox") then
{
	clearItemCargoGlobal _thing;
	clearWeaponCargoGlobal _thing;
	clearMagazineCargoGlobal _thing;
	clearBackpackCargoGlobal _thing;
};