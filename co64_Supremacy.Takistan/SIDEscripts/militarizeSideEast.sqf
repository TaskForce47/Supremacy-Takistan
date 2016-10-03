////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																																  //
//                      		***		ARMA3 Domination-Like-Script v1.0 - by Sepp	***											  //
//																																  //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////// Declare Variables  /////////////////////////////////////////////////////////////////////////////////////////////

private ["_side_select", "_side_mkr", "_side_trig", "_side_log_pos", "_side_mkr_text", "_side_name", "_side_rad", "_side_position","_side_flatPos", "_side_iniText","_side_missions","_side_details"];

_side_missions = ["gamsar","village"];
// _side_missions = ["gamsar"];

		
//////////////// Random Selects the AO  //////////////////////////////////////////////////////////////////////////////////////////		
_side_select = _side_missions call BIS_fnc_selectRandom;

sleep 30;

switch (_side_select) do { 
	case "gamsar" : {
	_side_details = [] call tf47_fnc_gamsar;
	}; 
	case "village" : {
	_side_details = [] call tf47_fnc_village;
	}; 
	default {}; 
};

_side_log_pos = _side_details select 0;
_side_rad = _side_details select 1;
_side_name = _side_details select 2;
		
//////////////// moves a visible marker to the side mission //////////////////////////////////////////////////////////////////////////		

"side_mkr1" setmarkerpos getpos _side_log_pos;
		
		
//////////////// Hint for completed Side Mission /////////////////////////////////////////////////////////////////////////////////////////// 

side_endText = format
	[
		"<t align='center' size='1.5'>Side Mission Completed!</t><br/><t size='1' align='center' color='#0040FF'>%1</t><br/>____________________<br/>Congratulations!<br/><br/> Outstanding work, Soldiers!",
		_side_name
	];

//////////////// Hint for failed Side Mission /////////////////////////////////////////////////////////////////////////////////////////// 

side_endText_fail = format
	[
		"<t align='center' size='1.5'>Side Mission Failed!</t><br/><t size='1' align='center' color='#FF0000'>%1</t><br/>____________________<br/>Well, that escalated quickly!<br/><br/> I mean, this got out of Hands fast!",
		_side_name
	];
	
	
//////////////// Hint for active Side Mission /////////////////////////////////////////////////////////////////////////////////////////// 

_side_iniText = format
	[
		"<t align='center' size='1.5'>New Side Mission available!</t><br/><t size='1' align='center' color='#0040FF'>%1</t>",
		_side_name
	];

//-------------------------------------------- Show global target start hint

[_side_iniText] remoteExec ["SEPP_fnc_globalHint",0,false];

	
//////////////// Sound for Hint for active Main Mission /////////////////////////////////////////////////////////////////////////////////////////// 

sleep 0.1;

["Sidemission_new"] remoteExec ["SEPP_fnc_globalsound",0,false];
