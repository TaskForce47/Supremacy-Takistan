if(!([] call TF47_Helper_fnc_checkForHc)) exitwith {};
// ===========================SideMission Selector =====================================
// =========originally by Wartheatre  adjusted by 4Lucke================================
private ["_missionsarray","_mission","_sidemission"];
sleep 30;

// ======================== random Side Mission Start ==================================
_missionsarray =["militarizeSideEast","militarizeSideWest"]; 								// Defines Scripts for Missions to execute
_mission = _missionsarray call BIS_fnc_selectRandom; 										// Selects wich SideMission is chosen
_sidemission = [] execVM format ["SIDEscripts\%1.sqf",_mission]; 							// Executes code
