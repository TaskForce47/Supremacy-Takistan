////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																																  //
//                      		*** Test Main objective	***											 						 //
//																																  //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include "AO_cfg.sqf"

#define TEST_INFO(MYTEXT)	(diag_log format["TESTFRAMEWORK File: %1, Line: %2: TEST_INFO %3",__FILE__, __LINE__,(MYTEXT)]);
#define TEST_ERROR(MYTEXT)	(diag_log format["TESTFRAMEWORK File: %1, Line: %2: TEST_ERROR %3",__FILE__, __LINE__,(MYTEXT)]);

_AONumber = param [0, 0]; 

/* first of all, a straight forward test */
TEST_INFO(format ["start AO test"]);

//[] call tf47_supremacy_main_fnc_initMainObjective;
//[_AONumber] spawn tf47_supremacy_main_fnc_startMainObjective;
//sleep 10;

//wait till mission creation is complete
waituntil {
!(tf47_supremacy_main_var_missionCreationOngoing select _AONumber)
}; 



/********************************** RADIOTOWER CHECKS *********************************/
_radiotower =  (tf47_supremacy_main_radiotowers select _AONumber);

//first check if we have a radio tower
if !(alive _radiotower) then {
	TEST_ERROR("Radio not spawned or instant destroyed");	
};

//destroy radio tower
_count = 0;
waituntil {
	_count = _count + 1;			 
	bomb = "Bo_GBU12_LGB" createVehicle (getpos _radiotower);
	sleep 0.3;
	(!(alive _radiotower) || (_count >6));
};

//check result
if (alive _radiotower) then {
	TEST_ERROR("Radio not alive");	
};

/************************************* UNIT CHECKS ************************************/
_mainPos = getpos ((tf47_supremacy_main_var_AOCollection select _AONumber) select TF47_SUPREMACY_MAIN_AOCOLLECTION_SELECT_LOGISTICMODULE);
_targets = (nearestObjects [_mainPos, ["CAManBase","LandVehicle"], 1000]); 
_targets = _targets - [player]; 

{ 
	_count = 0;	
	waituntil {
		_count = _count + 1;			 
		bomb = "Bo_GBU12_LGB" createVehicle (getpos _x);
		sleep 0.3;

		if (_count == 10) then {
			_x setPos (getpos _radiotower);
		};
		(!(alive _x) || (_count >20));
	}; 	
	
}foreach _targets;


/********************************* BUNKER TAKE OVER ***********************************/



