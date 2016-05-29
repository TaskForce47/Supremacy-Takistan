////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																																  //
//                      		***		ARMA3 Domination-Like-Script v1.0 - by Sepp	***											  //
//																																  //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////// Declare Variables  /////////////////////////////////////////////////////////////////////////////////////////////

private ["_side_Playertext", "_side_select", "_side_mkr", "_side_trig", "_side_log_pos", "_side_mkr_text", "_side_name", "_side_rad", "_side_position","_side_flatPos", "_side_iniText","_side_missions","_side_details"];

_side_missions = ["lalezar", "woods","convoy"];

		
//////////////// Random Selects the AO  //////////////////////////////////////////////////////////////////////////////////////////		

_side_select = _side_missions call BIS_fnc_selectRandom;

sleep 30;

switch (_side_select) do { 
	case "lalezar" : { 
	_side_details = [] call tf47_fnc_lalezar;
	}; 
	case "woods" : {
	_side_details = [] call tf47_fnc_woods;
	};
    case "convoy" : {
	_side_details = [] call tf47_fnc_convoy;
	};
	default {}; 
};

_side_log_pos = _side_details select 0;
_side_rad = _side_details select 1;
_side_name = _side_details select 2;

//////////////// moves a visible marker to the ao //////////////////////////////////////////////////////////////////////////		

"side_mkr1" setmarkerpos getpos _side_log_pos;
		
		
//////////////// Hint for completed Main Mission /////////////////////////////////////////////////////////////////////////////////////////// 

side_endText = format
	[
		"<t align='center' size='1.5'>Side Mission Completed!</t><br/><t size='1' align='center' color='#0040FF'>%1</t><br/>____________________<br/>Congratulations!<br/><br/> Outstanding work, Soldiers!",
		_side_name
	];

//////////////// Hint for active Main Mission /////////////////////////////////////////////////////////////////////////////////////////// 

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
