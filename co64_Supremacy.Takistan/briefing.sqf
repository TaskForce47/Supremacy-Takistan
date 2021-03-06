// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitfaction","_message","_file"];
_file = "briefing.sqf";
waitUntil {!isnil "f_var_debugMode"};

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction

_unitfaction = toLower (faction player);

// If the unitfaction is different from the group leader's faction, the latters faction is used
if (_unitfaction != toLower (faction (leader group player))) then {_unitfaction = toLower (faction (leader group player))};

// DEBUG
	if (f_var_debugMode > 0) then
	{
	_message =  format ["DEBUG (briefing.sqf): Player faction: %1",_unitfaction];
	[_message,_file] call TF47_Helper_fnc_debugCase;
	};

// ====================================================================================

// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

if (serverCommandAvailable "#kick") then {

#include "f\briefing\f_briefing_admin.sqf"

// DEBUG
	if (f_var_debugMode > 0) then
	{
		_message =  format ["DEBUG (briefing.sqf): Briefing for host selected.",_unitfaction];
		[_message,_file] call TF47_Helper_fnc_debugCase;
	};
};

// ====================================================================================

// BRIEFING: BLUFOR > NATO
// The following block of code executes only if the player is in a NATO slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "blu_f") exitwith {

#include "f\briefing\f_briefing_nato.sqf"

// DEBUG
	if (f_var_debugMode > 0) then
	{
	_message =  format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	[_message,_file] call TF47_Helper_fnc_debugCase;
	};
};

// ====================================================================================

// BRIEFING: FIA
// The following block of code executes only if the player is in a FIA slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["blu_g_f","ind_g_f","opf_g_f"]) exitwith {

#include "f\briefing\f_briefing_nato.sqf"

// DEBUG
	if (f_var_debugMode > 0) then
	{
	_message =  format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	[_message,_file] call TF47_Helper_fnc_debugCase;
	};
};

// ====================================================================================

/*// BRIEFING: OPFOR > CSAT
// The following block of code executes only if the player is in a CSAT slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["opf_f", "rhs_faction_msv"]) exitwith {

#include "f\briefing\f_briefing_csat.sqf"

// DEBUG
	if (f_var_debugMode > 0) then
	{
	_message =  format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	[_message,_file] call TF47_Helper_fnc_debugCase;
	};
};
// ====================================================================================

// BRIEFING: INDEPENDENT > AAF
// The following block of code executes only if the player is in a AAF
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "ind_f") exitwith {

#include "f\briefing\f_briefing_aaf.sqf"

// DEBUG
	if (f_var_debugMode > 0) then
	{
	_message =  format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	[_message,_file] call TF47_Helper_fnc_debugCase;
	};
};

// ====================================================================================

// BRIEFING: CIVILIAN
// The following block of code executes only if the player is in a CIVILIAN
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "civ_f") exitwith {

#include "f\briefing\f_briefing_civ.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	_message =  format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	[_message,_file] call TF47_Helper_fnc_debugCase;
	};
};

// ====================================================================================

// BRIEFING: ZEUS
// The following block of code executes only if the player is in a ZEUS (Gamelogic) slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "") exitwith {

#include "f\briefing\f_briefing_zeus.sqf"

// DEBUG
	if (f_var_debugMode > 0) then
	{
	_message =  format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	[_message,_file] call TF47_Helper_fnc_debugCase;
	};
};


*/// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

_message = format ["DEBUG (briefing.sqf): Faction %1 is not defined.",_unitfaction];
[_message,_file] call TF47_Helper_fnc_debugCase;