private ["_side_log_pos","_side_rad","_side_name","_side_trig","_side_position","_side_flatPos", "_side_ai_skill_array","_heliside_loc","_heliside_loc_select","_helo"];

_ao = getMarkerPos "ao_mkr1";
_oldSide = getMarkerPos "side_mkr1";

_pilotside = [
    [10422.568,6422.94,0], // Garmsar
    [2627.28,5100.469,0], // Jilavur
    [5191.505,6073.532,0], // Feruz Abad
    [6046.559,10471.909,0]  // Rasman
    ];
_pilotside = _pilotside call BIS_fnc_arrayShuffle;
{
    _newSide = _x;
    if ((_oldSide distance _newSide > 1500) && (_ao distance _newSide > 1500)) then
    {
        log_gamsar_side setpos _newSide;
    };
} forEach _pilotside;

_side_log_pos   	= log_gamsar_side;
_side_rad    		= 100;
//_mkr_text  		=
_side_name   		= "Rescue the Pilot";
_side_trig 			= "";
_side_ai_skill_array  = [0.3,0.5,0.3,0.7,0.5,1,0.8,0.5,0.5,0.5]; // [aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed] 

heliside_hintText1 = format
	[
		"<t align='center' size='1.5'>Side Mission:</t><br/><t size='1' align='center' color='#0040FF'>%1</t><br/>____________________<br/>is nearly completed<br/><br/> Now bring back the captured Helicopter or destroy it!",
        _side_name];
        
heliside_hintText2 = format
	[
		"<t align='center' size='1.5'>Side Mission:</t><br/><t size='1' align='center' color='#0040FF'>%1</t><br/>____________________<br/>is nearly completed<br/><br/> Now escort the captured Pilot to the flag at the Base!",
        _side_name];

sleep 1;

//////////////// create a CapVeh1 /////////////////////////////////////////////////////////////////////////////////////////////

_helo = switch (tf47_param_vehiclemod) do { 
	// Van
	case 0 : {
		"B_Heli_Attack_01_F";
	};
	// CUP
	case 1 : {
		"CUP_B_AH1Z_Escort";
	};
	// RHS
	case 2 : {
		"RHS_AH1Z";
	};
};

CapVeh1 = _helo createVehicle (getPos _side_log_pos);
waitUntil { sleep 0.5; alive CapVeh1 };
CapVeh1 setVectorUp [0,0,1];
CapVeh1 setHit ["motor", 1];
CapVeh1Alive = true;									

[CapVeh1] remoteExec ["tf47_fnc_nukeHelo", 0, true];

//////////////// creates a task/show notification for the ao ///////////////////////////////////////////////////////////////////////////////////////		

["tsk2", true, ["Find the Attack Helicopter captured by enemy troops bring it to the marker at the Base or destroy it, then find and capture the missing pilot held as hostage and return him to the flag at the Base.","Side Mission: Rescue the Pilot","Side Mission"],getPos _side_log_pos, "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;


//////////////// create 2 ai patrol around CapVeh1 /////////////////////////////////////////////////////////////////////////

sleep 0.1;
nul = [CapVeh1,2,20,[true,false],[false,false,false],false,[2,0],[0,0],_side_ai_skill_array,nil,nil,nil] execVM "LV\militarize.sqf";	
nul = [_side_log_pos,1,false,1,[1,0],50,"default",nil,"pilot1 = this; removeAllWeapons this; this setcaptive true; removeHeadgear this;",nil] execVM "LV\fillHouseOfficer.sqf";


nul = [_side_log_pos,2,true,2,[2,2],_side_rad,_side_ai_skill_array,nil,nil,nil] execVM "LV\fillHouse.sqf";
nul = [_side_log_pos,2,_side_rad,[true,false],[true,false,false],false,[10,0],[0,0],_side_ai_skill_array,nil,nil,nil] execVM "LV\militarize.sqf";
nul = [_side_log_pos,2,_side_rad,[true,false],[true,false,false],true,[0,0],[1,0],_side_ai_skill_array,nil,nil,nil] execVM "LV\militarize.sqf";




//////////////// create triggers at side mission ////////////////////////////////////////////////////////////////////////////////////////			

sleep 1;


heli_side_trig2 = createTrigger 		["EmptyDetector", getPos _side_log_pos];   
heli_side_trig2 setTriggerArea 		[0, 0, 0, false];  
heli_side_trig2 setTriggerActivation ["Any", "present", true];   
heli_side_trig2 setTriggerStatements ["!alive pilot1", "0 = execVM ""SIDEscripts\militarizeSideWest.sqf""; 
								[side_endText_fail] remoteExec [""SEPP_fnc_globalHint"",0,false]; 
								[""Sidemission_failed""] remoteExec [""SEPP_fnc_globalsound"",0,false]; 
								[""tsk2"", true, ['Find the Attack Helicopter captured by enemy troops bring it to the marker at the Base or destroy it, then find and capture the missing pilot held as hostage and return him to the flag at the Base.','Side Mission: Rescue the Pilot',""Side Mission""],getPos _side_log_pos, ""FAILED"", 1, true, true,"""",true] call BIS_fnc_setTask; 
								[[CapVeh1,pilot1]] spawn tf47_fnc_cleanside;
								deletevehicle heli_side_trig; deletevehicle thisTrigger" , ""];
                                
heli_side_trig = createTrigger 		["EmptyDetector", getPos D_FLAG_BASE];   
heli_side_trig setTriggerArea 		[5, 5, 0, false];  
heli_side_trig setTriggerActivation ["Any", "present", true];   
heli_side_trig setTriggerStatements ["(pilot1 in thislist) && (!alive CapVeh1)", 
								"0 = execVM ""SIDEscripts\militarizeSideWest.sqf""; 
								[side_endText] remoteExec [""SEPP_fnc_globalHint"",0,false]; 
								[""Sidemission_complete""] remoteExec [""SEPP_fnc_globalsound"",0,false]; 
								[""tsk2"", true, ['Find the Attack Helicopter captured by enemy troops bring it to the marker at the Base or destroy it, then find and capture the missing pilot held as hostage and return him to the flag at the Base.','Side Mission: Rescue the Pilot',""Side Mission""],getPos _side_log_pos, ""SUCCEEDED"", 1, true, true,"""",true] call BIS_fnc_setTask; 
								[""tf47_changetickets"", [WEST, 5, 5]] call CBA_fnc_globalEvent;
								[[CapVeh1,pilot1]] spawn tf47_fnc_cleanside;
								deletevehicle heli_side_trig2; deletevehicle thisTrigger" , ""];
                                
//////////////// makes pilot handcuffed ///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 1;
 if (f_var_medical >= 1) then {[pilot1, true] call ACE_captives_fnc_setHandcuffed;};
[_side_log_pos,_side_rad,_side_name]