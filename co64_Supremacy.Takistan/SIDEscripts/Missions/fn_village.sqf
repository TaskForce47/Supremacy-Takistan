
private ["_side_log_pos","_side_rad","_side_name","_side_ai_skill_array"];

_side_log_pos   		= log_village;
_side_rad    			= 100;
//_mkr_text 	 		=
_side_name   			= "Officer's Hideout";
_side_ai_skill_array  = [0.3,0.5,0.3,0.7,0.5,1,0.8,0.5,0.5,0.5]; // [aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed] 

_ao = getMarkerPos "ao_mkr1";
_oldSide = getMarkerPos "side_mkr1";
_random_village_area = _oldSide;

while {(_oldSide distance _random_village_area < 1500) || (_ao distance _random_village_area < 1500)} do
{
_find_village = selectBestPlaces [[6685.715, 9674.075], 7000, "houses + forest", 1, 1];
_random_village_area = (_find_village select 0) select 0;
};

log_village setpos _random_village_area;
sleep 1;

nul = [_side_log_pos,2,true,1,[1,0],_side_rad,_side_ai_skill_array,nil,"offizier = this; removeAllWeapons this; this setcaptive true; removeBackpackGlobal this;",nil] execVM "LV\fillHouseOfficer.sqf";
nul = [_side_log_pos,2,_side_rad,[true,false],[true,false,false],false,[10,0],[0,0],_side_ai_skill_array,nil,nil,nil] execVM "LV\militarize.sqf";



//////////////// creates a task/show notification for the ao ///////////////////////////////////////////////////////////////////////////////////////		

["tsk3", true, ["Find the enemy Officer. Capture him and bring him to Base for further Interrogation.","Side Mission: Officer Hideout","Side Mission"],getPos _side_log_pos, "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;

//////////////// create triggers at side mission ////////////////////////////////////////////////////////////////////////////////////////			

sleep 1;

officer_trig1 = createTrigger 		["EmptyDetector", getPos D_FLAG_BASE];   
officer_trig1 setTriggerArea 		[5, 5, 0, false];  
officer_trig1 setTriggerActivation ["ANY", "present", false];   
officer_trig1 setTriggerStatements ["offizier in thislist;", 
								"0 = execVM ""SIDEscripts\militarizeSideWest.sqf""; 
								[side_endText] remoteExec [""SEPP_fnc_globalHint"",0,false];  
								[""Sidemission_complete""] remoteExec [""SEPP_fnc_globalsound"",0,false]; 
								[""tsk3"", true, ['Find the enemy Officer. Capture him and bring him to Base for further Interrogation.','Side Mission: Officer Hideout',""Side Mission""],
								getPos _side_log_pos, ""SUCCEEDED"", 1, true, true,"""",true] call BIS_fnc_setTask; 
								[""tf47_changetickets"", [WEST, 2, 5]] call CBA_fnc_globalEvent; deletevehicle officer_trig2; deletevehicle officer_trig3;
								[[offizier]] spawn tf47_fnc_cleanside;
								deletevehicle thisTrigger" , ""];

sleep 1;

officer_trig2 = createTrigger 		["EmptyDetector", getPos _side_log_pos];   
officer_trig2 setTriggerArea 		[0, 0, 0, false];  
officer_trig2 setTriggerActivation ["NONE", "notpresent", true];   
officer_trig2 setTriggerStatements ["!alive offizier", "0 = execVM ""SIDEscripts\militarizeSideWest.sqf""; 
								[side_endText_fail] remoteExec [""SEPP_fnc_globalHint"",0,false];  
								[""Sidemission_failed""] remoteExec [""SEPP_fnc_globalsound"",0,false]; 
								[""tsk3"", true, ['Find the enemy Officer. Capture him and bring him to Base for further Interrogation.','Side Mission: Officer Hideout',""Side Mission""],
								getPos _side_log_pos, ""FAILED"", 1, true, true,"""",true] call BIS_fnc_setTask; 
								[[offizier]] spawn tf47_fnc_cleanside; deletevehicle officer_trig1; deletevehicle officer_trig3; 
								deletevehicle thisTrigger" , ""];

                       
/////////////// let officer surrender when he detects enemy/prevents him from fleeing ////////////////////////////////////////////////////////////////
sleep 1;
 if (f_var_medical >= 1) then {
officer_trig3 = createTrigger 		    ["EmptyDetector", getPos _side_log_pos];   
officer_trig3 setTriggerArea 		    [500, 500, 0, false];  
officer_trig3 setTriggerActivation      ["WEST", "GUER D", false];
officer_trig3 setTriggerStatements      ["this", "
                                        [offizier, true] call ACE_captives_fnc_setSurrendered;
                                        deletevehicle thisTrigger" , ""];}
                                        
                         else {
officer_trig3 = createTrigger 		    ["EmptyDetector", getPos _side_log_pos];   
officer_trig3 setTriggerArea 		    [500, 500, 0, false];  
officer_trig3 setTriggerActivation      ["WEST", "GUER D", false];
officer_trig3 setTriggerStatements      ["this", "
                                        offizier setUnitPos ""DOWN"";
                                        doStop offizier; offizier disableAI ""MOVE"";
                                        deletevehicle thisTrigger" , ""];
                         };
                                
[_side_log_pos,_side_rad,_side_name]