/*
*	Central Mission Coordinator 
*/ 

#include "missionManager_cfg.sqf";

private ["_activeMainMissionCounter","_listOfPossibleNewMainObjectives","_randomElement"];
_activeMainMissionCounter = 0;

//start  main missions
for [{_x= 1},{_x <= TF47_SUPREMACY_NUMBER_OF_MAX_MAIN_MISSIONS},{_x = _x + 1}] do {
       
	sleep 10;             
	_listOfPossibleNewMainObjectives = [] call tf47_supremacy_main_fnc_getNewObjectives;
	_randomElement = selectRandom _listOfPossibleNewMainObjectives;
    [_randomElement] spawn tf47_supremacy_main_fnc_startMainObjective;   
};  

sleep 10;

while {true} do {
    sleep 30;   
    
    //check if maximum of completed main mission is reached      
   	if (count ([] call tf47_supremacy_main_fnc_getSuccessfulMainObjectives) >= tf47_param_mainCount) exitWith {        
		[1] call f_fnc_mpEnd;        
    };   
    
    //check amount of active main missions, in case we are below  TF47_SUPREMACY_NUMBER_OF_MAX_MAIN_MISSIONS it will spwan an additional mission        
    if ((count ([] call tf47_supremacy_main_fnc_getActiveMainObjectives)) < TF47_SUPREMACY_NUMBER_OF_MAX_MAIN_MISSIONS) then {
    	_listOfPossibleNewMainObjectives = [] call tf47_supremacy_main_fnc_getNewObjectives;
		_randomElement = selectRandom _listOfPossibleNewMainObjectives;
   		 [_randomElement] spawn tf47_supremacy_main_fnc_startMainObjective;       
    };    
    
    //check amount of active side missions, in case we are below  TF47_SUPREMACY_NUMBER_OF_MAX_SIDE_MISSIONS it will spwan an additional mission      
    /*  
    if ((count ([] call tf47_supremacy_main_fnc_getActiveMainObjectives)) <= TF47_SUPREMACY_NUMBER_OF_MAX_SIDE_MISSIONS) then {
    	_listOfPossibleNewSideObjectives = [] call tf47_supremacy_main_fnc_getNewObjectives;
		_randomElement = selectRandom _listOfPossibleNewSideObjectives;
   		 [_randomElement] spawn tf47_supremacy_side_fnc_startSideObjective;       
    };
    */   
};


