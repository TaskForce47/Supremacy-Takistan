////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																																  //
//                      		***		ARMA3 Takistan Script Jet Patrol - by Sepp	***						        			  //
//																																  //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////// Exit if not server /////////////////////////////////////////////////////////////////////////////////////////////
if(!([2] call TF47_Helper_fnc_checkForHc)) exitwith {};


private ["_alert_log_pos","_alert_rad","_alert_name","_alert_iniText","_pilot","_jet","_alert_endText"];

sleep (2400 +(random 600));

_alert_log_pos   		= log_airfield;
//_alert_rad    		= 100;
_alert_name   			= "Enemy Air Patrol";



//////////////// Hint for active Alert Mission /////////////////////////////////////////////////////////////////////////////////////////// 

_alert_iniText = format
	[
		"<t align='center' size='1.5'>ALERT: Enemy Activity at Rasman Airfield!</t><br/><t size='1' align='center' color='#DAA520'>%1</t>",
		_alert_name
	];

//-------------------------------------------- Show global target start hint

[_alert_iniText] remoteExec ["SEPP_fnc_globalHint",0,false];


//////////////// Hint for End of Alert Mission /////////////////////////////////////////////////////////////////////////////////////////// 

_alert_endText = format
	[
		"<t align='center' size='1.5'>Air Patrol is gone, Radar clear!</t><br/><t size='1' align='center' color='#DAA520'>%1</t>",
		_alert_name
	];

//Creates marker for waypoints

_marker1 = createMarker ["PILOTsp1",[5714.354,11228.885]];
_marker2 = createMarker ["SUsp1",[5827.765,11351.408]];
_marker3 = createMarker ["SUsp2",[5789.61,11308.09]];
_marker4 = createMarker ["SUsp3",[5743.985,11264.77]];
_marker5 = createMarker ["WP_East1",[5827.765,11351.408]];
_marker6 = createMarker ["WP_East1_2",[5789.61,11308.09]];
_marker7 = createMarker ["WP_East1_3",[5743.985,11264.77]];
_marker8 = createMarker ["WP_East2",[6092.905,11813.875]];
_marker9 = createMarker ["WP_East3",[1778.449,4455.155]];
_marker10 = createMarker ["WP_East4",[10453.731,6803.086]];
_marker11 = createMarker ["WP_East5",[7238.282,12748.9]];

{_x setMarkerType "Empty";} forEach ["PILOTsp1","SUsp1","SUsp2","SUsp3","WP_East1","WP_East1_2","WP_East1_3","WP_East2","WP_East3","WP_East4"];

//Creates a group with 3 soldiers at position PILOTsp1

_pilot = "";
_jet = "";

switch (tf47_param_vehiclemod) do { 
	// Van
	case 0 : {
		_pilot = "I_pilot_F";
		_jet = "I_Plane_Fighter_03_AA_F";
	};
	// CUP
	case 1 : {
		_pilot = "CUP_O_TK_Pilot";
		_jet = "CUP_O_Su25_TKA";
	};
	// RHS
	case 2 : {
		_pilot = "rhsgref_ins_g_pilot";
		_jet = "rhsgref_cdf_su25";
	};
};

_group1 = [getMarkerPos "PILOTsp1", East, [_pilot],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_group2 = [getMarkerPos "PILOTsp1", East, [_pilot],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_group3 = [getMarkerPos "PILOTsp1", East, [_pilot],[],[],[],[],[],180] call BIS_fnc_spawnGroup;


JetVeh1   = _jet createVehicle getMarkerPos "SUsp1";
JetVeh2   = _jet createVehicle getMarkerPos "SUsp2";
JetVeh3   = _jet createVehicle getMarkerPos "SUsp3";

_dirsp = 315;

sleep 0.1;

JetVeh1 setdir _dirsp;
JetVeh2 setdir _dirsp;
JetVeh3 setdir _dirsp;

//creates the first waypoint at position marker1
_wp1 = _group1 addWaypoint [getMarkerPos "WP_East1", 0];
_wp1 setWaypointType "GETIN NEAREST";

_wp1_2 = _group2 addWaypoint [getMarkerPos "WP_East1_2", 0];
_wp1_2 setWaypointType "GETIN NEAREST";

_wp1_3 = _group3 addWaypoint [getMarkerPos "WP_East1_3", 0];
_wp1_3 setWaypointType "GETIN NEAREST";

//creates the second waypoint at position marker2
_wp2    = _group1 addWaypoint [getMarkerPos "WP_East2", 0];
_wp2_2  = _group2 addWaypoint [getMarkerPos "WP_East2", 0];
_wp2_3  = _group3 addWaypoint [getMarkerPos "WP_East2", 0];

//creates the third waypoint at position marker3
_wp3    = _group1 addWaypoint [getMarkerPos "WP_East3", 0];
_wp3_2  = _group2 addWaypoint [getMarkerPos "WP_East3", 0];
_wp3_3  = _group3 addWaypoint [getMarkerPos "WP_East3", 0];

//creates the third waypoint at position marker4
_wp4     = _group1 addWaypoint [getMarkerPos "WP_East4", 0];
_wp4_2   = _group2 addWaypoint [getMarkerPos "WP_East4", 0];
_wp4_3   = _group3 addWaypoint [getMarkerPos "WP_East4", 0];

//creates the third waypoint at position marker4
_wp5     = _group1 addWaypoint [getMarkerPos "WP_East5", 0];
_wp5_2   = _group2 addWaypoint [getMarkerPos "WP_East5", 0];
_wp5_3   = _group3 addWaypoint [getMarkerPos "WP_East5", 0];

//creates the forth waypoint to land at position marker2
_wp6     = _group1 addWaypoint [getMarkerPos "WP_East2", 0];
_wp6 setWaypointStatements ["true", "JetVeh1 land 'LAND';"];

_wp6_2   = _group2 addWaypoint [getMarkerPos "WP_East2", 0];
_wp6_2 setWaypointStatements ["true", "JetVeh2 land 'LAND';"];

_wp6_3   = _group3 addWaypoint [getMarkerPos "WP_East2", 0];
_wp6_3 setWaypointStatements ["true", "JetVeh3 land 'LAND';"];

//Sets the behaviour and speed of the units to "SAFE" and "LIMITED" and the waypointType to "MOVE"
{
	_x setWaypointBehaviour "AWARE"; 
	_x setWaypointSpeed "FULL";
	_x setWaypointType "MOVE";
    
} forEach [_wp2, _wp2_2, _wp2_3, _wp3, _wp3_2, _wp3_3, _wp4, _wp4_2, _wp4_3, _wp5, _wp5_2, _wp5_3];


//creates trigger to delete the taxiing Jets + Groups

        _trig1 = createTrigger 					    ["EmptyDetector", [5898.425,11489.13]];
		_trig1 setTriggerArea 					    [20, 20, 0, false];
		_trig1 setTriggerActivation 				["ANY", "present", false];  
		_trig1 setTriggerStatements 				["JetVeh1 in thislist;", "{deleteVehicle _x} forEach (crew JetVeh1); deleteVehicle JetVeh1; deletevehicle thisTrigger" , ""];
        
        _trig2 = createTrigger 					    ["EmptyDetector", [5898.425,11489.13]];
		_trig2 setTriggerArea 					    [20, 20, 0, false];
		_trig2 setTriggerActivation 				["ANY", "present", false];  
		_trig2 setTriggerStatements 				["JetVeh2 in thislist;", "{deleteVehicle _x} forEach (crew JetVeh2); deleteVehicle JetVeh2; deletevehicle thisTrigger" , ""];
        
        _trig3 = createTrigger 					    ["EmptyDetector", [5898.425,11489.13]];
		_trig3 setTriggerArea 					    [20, 20, 0, false];
		_trig3 setTriggerActivation 				["ANY", "present", false];  
		_trig3 setTriggerStatements 				["JetVeh3 in thislist;", "{deleteVehicle _x} forEach (crew JetVeh3); deleteVehicle JetVeh3; deletevehicle thisTrigger" , ""];

sleep 1;

//deletes all marker 
{deleteMarker _x} 
forEach ["PILOTsp1","SUsp1","SUsp2","SUsp3","WP_East1","WP_East1_2","WP_East1_3","WP_East2","WP_East3","WP_East4","WP_East5"];

_side_trig1 = createTrigger 		["EmptyDetector", getPos _alert_log_pos];   
_side_trig1 setTriggerArea 		    [0, 0, 0, false];  
_side_trig1 setTriggerActivation    ["ANY", "present", false];   
_side_trig1 setTriggerStatements    [" !(alive JetVeh1) && !(alive JetVeh2) && !(alive JetVeh3)", 
                                    "0 = execVM ""TacAds\jetpatrolinit.sqf"";
                                    deletevehicle thisTrigger" , ""];
