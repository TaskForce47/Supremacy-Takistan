////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																																  //
//                      		***		ARMA3 Takistan Script Convoy - by Sepp	***						        			      //
//																																  //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
private ["_side_log_pos","_side_rad","_side_name","_convoy_end_select","_convoy_ends","_apc","_refuel","_repair","_techMg"];

_side_log_pos   		= log_airfield;
_side_rad    			= 100;
//_mkr_text 	 		=
_side_name   			= "Convoy";

// Creates Task
["tsk11", true, ["Find and Stop the Enemy Convoy carrying Supplies from Rasman Airfield to their new potential FOB's!","Side Mission: Convoy","Side Mission"], getMarkerpos "WP_Convoy_Start", "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;


// Creates marker for waypoints
_markerstart    = createMarker ["WP_Convoy_Start",     [6118.237,11593.607]]; //rasman airfield

_convoy_ends = ["marker1", "marker2","marker3","marker4"];
_convoy_end_select = _convoy_ends call BIS_fnc_selectRandom;

switch (_convoy_end_select) do { 
	case "marker1" : { 
	_markerend   = createMarker ["WP_Convoy_End",       [585.625,2839.806]]; // chaman
	}; 
	case "marker2" : {
	_markerend   = createMarker ["WP_Convoy_End",       [3680.909,4380.701]]; // sakhe
	};
    case "marker3" : {
	_markerend   = createMarker ["WP_Convoy_End",       [8908.616,5322.335]]; // timurkulay
	};
    case "marker4" : {
	_markerend   = createMarker ["WP_Convoy_End",       [10400.663,6358.196]]; // garmsar
	};
	default {}; 
};

"WP_Convoy_Start" setMarkerType "hd_start";
"WP_Convoy_Start" setMarkerText "Convoy Start";
"WP_Convoy_End" setMarkerType "hd_end";
"WP_Convoy_End" setMarkerText "Convoy End";

_apc = "";
_refuel = "";
_repair = "";
_techMg = "";

switch (tf47_param_vehiclemod) do { 
	// Van
	case 0 : {
		_apc = "I_APC_tracked_03_cannon_F";
		_refuel = "I_Truck_02_fuel_F";
		_repair = "I_Truck_02_box_F";
		_techMg = "I_MRAP_03_hmg_F";
	};
	// CUP
	case 1 : {
		_apc = "CUP_O_BTR60_TK";
		_refuel = "CUP_O_URAL_REFUEL_TKA";
		_repair = "CUP_O_URAL_REPAIR_TKA";
		_techMg = "CUP_O_UAZ_MG_TKA";
	};
	// RHS
	case 2 : {
		_apc = "rhsgref_ins_g_btr70";
		_refuel = "rhsgref_ins_g_gaz66_r142";
		_repair = "rhsgref_ins_g_gaz66_repair";
		_techMg = "rhsgref_cdf_reg_uaz_dshkm";
	};
};
// Creates Convoy
_groupconvoy = createGroup resistance;

_convoy_veh_array1 = [getMarkerPos "WP_Convoy_Start", 206, _apc, _groupconvoy] call bis_fnc_spawnvehicle;
my_convoy_vec1 = _convoy_veh_array1 select 0;
sleep 0.5;
_convoy_veh2_pos = my_convoy_vec1 getRelPos [30, 180];
_convoy_veh_array2 = [_convoy_veh2_pos, 206, _refuel, _groupconvoy] call bis_fnc_spawnvehicle;
my_convoy_vec2 = _convoy_veh_array2 select 0;
sleep 0.5;
_convoy_veh3_pos = my_convoy_vec2 getRelPos [30, 180];
_convoy_veh_array3 = [_convoy_veh3_pos, 206, _repair, _groupconvoy] call bis_fnc_spawnvehicle;
my_convoy_vec3 = _convoy_veh_array3 select 0;
sleep 0.5;
_convoy_veh4_pos = my_convoy_vec3 getRelPos [30, 190];
_convoy_veh_array4 = [_convoy_veh4_pos, 206, _techMg, _groupconvoy] call bis_fnc_spawnvehicle;
my_convoy_vec4 = _convoy_veh_array4 select 0;



// Creates the waypoint at position of marker
_wp_end =   _groupconvoy addWaypoint [getMarkerPos "WP_Convoy_End", 0];

// Sets the behaviour and speed of the units to "CARELESS" and "LIMITED" and the waypointType to "MOVE"
{
    _x setWaypointBehaviour "CARELESS"; 
    _x setWaypointSpeed "LIMITED";
    _x setWaypointType "MOVE";
	
} forEach [_wp_end];


// Creates trigger to delete the Convoy when reaching its destination

        _trig1 = createTrigger 					    ["EmptyDetector", getMarkerPos "WP_Convoy_End"];
		_trig1 setTriggerArea 					    [20, 20, 0, false];
		_trig1 setTriggerActivation 				["ANY", "present", false];  
		_trig1 setTriggerStatements 				["my_convoy_vec1 in thislist", "{deleteVehicle _x} forEach (crew my_convoy_vec1); deleteVehicle my_convoy_vec1; deletevehicle thisTrigger" , ""];
        
        _trig2 = createTrigger 					    ["EmptyDetector", getMarkerPos "WP_Convoy_End"];
		_trig2 setTriggerArea 					    [20, 20, 0, false];
		_trig2 setTriggerActivation 				["ANY", "present", false];  
		_trig2 setTriggerStatements 				["my_convoy_vec2 in thislist", "{deleteVehicle _x} forEach (crew my_convoy_vec2); deleteVehicle my_convoy_vec2; deletevehicle thisTrigger" , ""];
        
        _trig3 = createTrigger 					    ["EmptyDetector", getMarkerPos "WP_Convoy_End"];
		_trig3 setTriggerArea 					    [20, 20, 0, false];
		_trig3 setTriggerActivation 				["ANY", "present", false];  
		_trig3 setTriggerStatements 				["my_convoy_vec3 in thislist", "{deleteVehicle _x} forEach (crew my_convoy_vec3); deleteVehicle my_convoy_vec3; deletevehicle thisTrigger" , ""];
        
        _trig4 = createTrigger 					    ["EmptyDetector", getMarkerPos "WP_Convoy_End"];
		_trig4 setTriggerArea 					    [20, 20, 0, false];
		_trig4 setTriggerActivation 				["ANY", "present", false];  
		_trig4 setTriggerStatements 				["my_convoy_vec4 in thislist", "{deleteVehicle _x} forEach (crew my_convoy_vec4); deleteVehicle my_convoy_vec4; deletevehicle thisTrigger" , ""];

sleep 1;

// Trigger for Side Mission Completion/Failing
convoy_trig1 = createTrigger 		    ["EmptyDetector", getMarkerPos "WP_Convoy_End"];   
convoy_trig1 setTriggerArea 		    [0, 0, 0, false];  
convoy_trig1 setTriggerActivation   ["ANY", "present", false];   
convoy_trig1 setTriggerStatements   [" !(alive my_convoy_vec1) && !(alive my_convoy_vec2) && !(alive my_convoy_vec3) && !(alive my_convoy_vec4)", 
                                    "0 = execVM ""SIDEscripts\militarizeSideEast.sqf""; 
									[side_endText] remoteExec [""SEPP_fnc_globalHint"",0,false]; 
									[""Sidemission_complete""] remoteExec [""SEPP_fnc_globalsound"",0,false]; 
									[""tsk11"", true, ['Find and Stop the Enemy Convoy!','Side Mission: Convoy',""Side Mission""],
									getMarkerpos ""WP_Convoy_Start"", ""SUCCEEDED"", 1, true, true,"""",true] call BIS_fnc_setTask; 
									[""tf47_changetickets"", [WEST, 2, 5]] call CBA_fnc_globalEvent; 
                                    {deleteMarker _x} forEach [""WP_Convoy_Start"", ""WP_Convoy_End""]; [[]] spawn tf47_fnc_cleanside;
                                    deletevehicle convoy_trig2; deletevehicle convoy_trig3; deletevehicle thisTrigger", ""];
                                    
convoy_trig2 = createTrigger 		    ["EmptyDetector", getMarkerPos "WP_Convoy_End"];
convoy_trig2 setTriggerArea 			[150, 150, 0, false];
convoy_trig2 setTriggerActivation 	["ANY", "present", false];  
convoy_trig2 setTriggerStatements 	["my_convoy_vec2 in thislist", 
                                    "0 = execVM ""SIDEscripts\militarizeSideEast.sqf""; 
                                    [side_endText_fail] remoteExec [""SEPP_fnc_globalHint"",0,false];  
                                    [""Sidemission_failed""] remoteExec [""SEPP_fnc_globalsound"",0,false]; 
                                    [""tsk11"", true, ['Find and Stop the Enemy Convoy!','Side Mission: Convoy',""Side Mission""],
                                    getMarkerpos ""WP_Convoy_Start"", ""FAILED"", 1, true, true,"""",true] call BIS_fnc_setTask; 
                                    {deleteMarker _x} forEach [""WP_Convoy_Start"", ""WP_Convoy_End""]; [[]] spawn tf47_fnc_cleanside;
                                    deletevehicle convoy_trig1; deletevehicle convoy_trig3; deletevehicle thisTrigger" , ""];      

convoy_trig3 = createTrigger 		    ["EmptyDetector", getMarkerPos "WP_Convoy_End"];
convoy_trig3 setTriggerArea 			[150, 150, 0, false];
convoy_trig3 setTriggerActivation 	["ANY", "present", false];  
convoy_trig3 setTriggerStatements 	["my_convoy_vec3 in thislist", 
                                    "0 = execVM ""SIDEscripts\militarizeSideEast.sqf""; 
                                    [side_endText_fail] remoteExec [""SEPP_fnc_globalHint"",0,false];  
                                    [""Sidemission_failed""] remoteExec [""SEPP_fnc_globalsound"",0,false]; 
                                    [""tsk11"", true, ['Find and Stop the Enemy Convoy!','Side Mission: Convoy',""Side Mission""],
                                    getMarkerpos ""WP_Convoy_Start"", ""FAILED"", 1, true, true,"""",true] call BIS_fnc_setTask; 
                                    {deleteMarker _x} forEach [""WP_Convoy_Start"", ""WP_Convoy_End""]; [[]] spawn tf47_fnc_cleanside;
                                    deletevehicle convoy_trig1; deletevehicle convoy_trig2; deletevehicle thisTrigger" , ""];                                          

                                    
                                    
while {(count units _groupconvoy) <= 1} do {
        _groupconvoy setBehaviour "CARELESS";
        _groupconvoy setSpeedMode "LIMITED";
        _groupconvoy setFormation "COLUMN";
        sleep 5;
        }; 
        
[_side_log_pos,_side_rad,_side_name]
