/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

>> checks if players were spotted by the units in the main AO and sends reinforcements
>> uses advanced fish-AI to react to certain threats like tanks. jets and helicopters

parameter: []
------------------------------------------------------------------------------------
*/

if(!isServer) exitwith {};

if !(alive radiotower) then
{
	[TF47_var_reinforcementHandle] call CBA_fnc_removePerFrameHandler;
};

_enemyLeaders = [];
_enemyVehicles = [];
_enemyUnits = [];

_knownUnits = [];
_knownAir = [];
_knownTanks = [];
_knowledge = 0;

{
	if (!(side leader _x == playerSide) && ((leader _x) distance (getMarkerPos "ao_mkr1") < 800)) then				//find all enemy leaders in AO
	{
		_enemyLeaders pushBack _x;
		{
			if (assignedVehicle _x isKindOf "Tank") then
			{
				_enemyVehicles pushBackUnique (assignedVehicle _x);
			};
			_enemyUnits pushBack _x;
		} forEach units _x;
	};
} forEach allGroups;

if (count _enemyUnits > tf47_var_mainEnemyCount + 25) exitWith {};

_players = playableUnits - entities "HeadlessClient_F";

{
	_y = _x;
	{
		if (_x knowsAbout _y > 0.2) then
		{
			_knownUnits pushBackUnique _y;
		}
		else
		{
			if (_x knowsAbout vehicle _y > 0.2) then
			{
				if (vehicle _y isKindOf "Air") then
				{
					_knownAir pushBackUnique vehicle _y;
					hint "air";
					sleep 1;
				};
				if (vehicle _y isKindOf "Tank") then
				{
					_knownTanks pushBackUnique vehicle _y;
					hint "tank";
					sleep 1;
				};
			};
		};
		_knowledge = _knowledge + (_x knowsAbout vehicle _y);
	} forEach _enemyLeaders;
} forEach _players;

_knowledge = _knowledge / ((1 + count _enemyLeaders));
_knownUnitsCount = (count _knownUnits) + 10*(count _knownAir) + 7*(count _knownTanks);


// hint format ["Blufor units spottet: %1 - %2", _knownUnitsCount, _knowledge];




if (!(tf47_var_reinforcements_heliArmed isEqualTo 0)) then
{
	if ((getPosATL tf47_var_reinforcements_heliArmed) select 2 < 3) then
	{
		tf47_var_reinforcements_heliArmed = 0;
	};
};
if (!(tf47_var_reinforcements_jetArmed isEqualTo 0)) then
{
	if ((getPosATL tf47_var_reinforcements_jetArmed) select 2 < 3) then
	{
		tf47_var_reinforcements_jetArmed = 0;
	};
};




if ((random tf47_param_reinforcementStrength < (_knowledge)) && (_knownUnitsCount > 0)) then
{
	switch (round random 2) do {
		case 0 : {
			[] spawn tf47_fnc_reinforcementsLandInf;
		};
		case 1 : {
			[] spawn tf47_fnc_reinforcementsHeliLand;
		};
		case 2 : {
			[] spawn tf47_fnc_reinforcementsHeliPara;
		};
	};	
	if (random (count _enemyVehicles)<2) then
	{
		[] spawn tf47_fnc_reinforcementsLandArmed;
	};
	if ((tf47_var_reinforcements_heliArmed isEqualTo 0) && (random (1/_knownUnitsCount) <0.005)) then
	{
		[] spawn tf47_fnc_reinforcementsHeliArmed;
	};
};




if ((count _knownTanks > 0) && (random tf47_param_reinforcementStrength < _knowledge) && (tf47_var_reinforcements_heliArmed isEqualTo 0)) then
{
	switch (round random 1) do {
		case 0 : {
			[] spawn tf47_fnc_reinforcementsLandAT;
		};
		case 1 : {
			[] spawn tf47_fnc_reinforcementsHeliArmed;
		};
	};
};

if (((count _knownAir > 0) || (count _knownTanks>0)) && (random tf47_param_reinforcementStrength < _knowledge) && (tf47_var_reinforcements_jetArmed isEqualTo 0)) then
{
	[] spawn tf47_fnc_reinforcementsJetArmed;
};