/*
	GrenadeStop v0.8 for ArmA 3 Alpha
	
AUTHOR:
	
	Bake (tweaked slightly by Chris)
	
DESCRIPTION:
	
	Stops players from throwing grenades and firing weapons in safety zones. Does not prevent vehicles firing.
	
CONFIGURATION:

	Edit the #defines below.
	
_______________________________________________________________________*/

#define SAFETY_ZONES	[["base_spawn", 300], ["despawn_prev01", 300],["despawn_prev02", 300],["despawn_prev03", 300]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE "Firing and placing / throwing items at base is STRICTLY PROHIBITED!"
//#define SNIPER_MSG "Only Snipers may use this weapon system. Sniper rifle removed."
/*
if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
waitUntil { !isNil "cfgTF47" };
call cfgTF47;*/
waitUntil {!isNull player};


player addEventHandler ["Fired", {	
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
	{
		_player = _this select 0;
		_player setVariable["TF47_SAFEZONE_COUNTER", (_player getVariable["TF47_SAFEZONE_COUNTER", 0]) + 1];
		_counter = _player getVariable["TF47_SAFEZONE_COUNTER", 0];
		if(_counter >= 6) then {
			// bye bye
			endMission "LOSER";
		};
		deleteVehicle (_this select 6);
		hint MESSAGE;
	};
	/*if (({(_this select 0) hasWeapon _x} count ["B_sniper_F","B_spotter_F"] > 0)) then {
		if (({(_this select 0) isKindOf _x} count ["CUP_Weapon_srifle_AS50","CUP_Weapon_arifle_Mk20"] < 1)) then {
			(_this select 0) removeWeapon (primaryWeapon (_this select 0));
			titleText [SNIPER_MSG,"PLAIN",3];
		};
	};*/
}];