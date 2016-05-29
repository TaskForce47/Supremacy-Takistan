private ["_side_log_pos","_side_rad","_side_name","_side_trig", "_side_ai_skill_array"];

_ao = getMarkerPos "ao_mkr1";
_oldSide = getMarkerPos "side_mkr1";
_random_woods_area = _oldSide;

while {(_oldSide distance _random_woods_area < 1500) || (_ao distance _random_woods_area < 1500)} do
{
    _find_woods = selectBestPlaces [[6685.715, 9674.075], 7000, "2*forest - 10*houses", 1, 1];
    _random_woods_area = (_find_woods select 0) select 0;
};

log_woods setpos _random_woods_area;

_side_log_pos   			= log_woods;
_side_rad    				= 150;
//_mkr_text 	 			=
_side_name   				= "In the Woods";
_side_ai_skill_array  = [0.3,0.5,0.3,0.7,0.5,1,0.8,0.5,0.5,0.5]; // [aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed] 


_posTent1 		= (getpos _side_log_pos) findEmptyPosition [5,30];
_posTent2 		= (getpos _side_log_pos) findEmptyPosition [5,30];
_posTent3 		= (getpos _side_log_pos) findEmptyPosition [5,30];
_posCampFire 	= (getpos _side_log_pos) findEmptyPosition [5,30];

sleep 0.1;

Tent1 		= "ACamp_EP1" createVehicle _posTent1;
Tent2 		= "ACamp_EP1" createVehicle _posTent2;
Tent3 		= "ACamp_EP1" createVehicle _posTent3;
CampFire 	= "Campfire_burning_F" createVehicle _posCampFire;

sleep 0.1;

//////////////// creates a task/show notification for the ao ///////////////////////////////////////////////////////////////////////////////////////		

["tsk5", true, ["Find the enemy Camp and eliminate all enemy Soldiers!","Side Mission: Woods","Side Mission"],getPos _side_log_pos, "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;


nul = [_side_log_pos,2,_side_rad,[true,false],[true,false,false],false,[15,0],[0,0],_side_ai_skill_array,nil,nil,nil] execVM "LV\militarize.sqf";

//////////////// create trigger at the side ////////////////////////////////////////////////////////////////////////////////////////			

sleep 1;

_side_trig = createTrigger 					["EmptyDetector", getPos _side_log_pos];   
_side_trig setTriggerArea 					[_side_rad, _side_rad, 0, false];  
_side_trig setTriggerActivation 			["GUER", "notpresent", true];   
_side_trig setTriggerStatements 			["this", 
											"0 = execVM ""SIDEscripts\militarizeSideEast.sqf""; 
											[side_endText] remoteExec [""SEPP_fnc_globalHint"",0,false]; 
											[""Sidemission_complete""] remoteExec [""SEPP_fnc_globalsound"",0,false]; 
											[""tsk5"", true, ['Find the enemy Camp and eliminate all enemy Soldiers!','Side Mission: Woods',""Side Mission""],
											getPos _side_log_pos, ""SUCCEEDED"", 1, true, true,"""",true] call BIS_fnc_setTask; 
											[[Tent1,Tent2,Tent3,CampFire]] spawn tf47_fnc_cleanside;
											[""tf47_changetickets"", [WEST, 2, 5]] call CBA_fnc_globalEvent;", ""];

[_side_log_pos,_side_rad,_side_name]