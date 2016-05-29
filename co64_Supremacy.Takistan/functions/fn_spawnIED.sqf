/*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

deletes old IED's and creates new ones near villages

parameter: [number of ied's]
------------------------------------------------------------------------------------
*/

private ["_position","_dir","_ieds","_explosives","_obj","_temp","_road","_roads","_roadsConnectedTo","_connectedRoad","_nearRoads"];

params ["_iedCount"];

_ieds = ["IEDUrbanSmall_F","IEDLandSmall_F","IEDUrbanBig_F","IEDLandBig_F"];//["CUP_IED_V1","CUP_IED_V2","CUP_IED_V3","CUP_IED_V4"];
_explosives = ["SLAMDirectionalMine","APERSMine"];

_temp = tf47_var_iedTracker;

{
	deleteVehicle _x;
	_temp = _temp - [_x];
} forEach tf47_var_iedTracker;

tf47_var_iedTracker = _temp;

_mapSize = getNumber(configFile >> "CfgWorlds" >> worldName >> "MapSize");

for [{_i=0}, {_i<_iedCount}, {_i=_i+1}] do
{
	_temp = 0;
	while {_temp == 0} do
	{
		_position = [(_mapsize * (random 1)),(_mapsize * (random 1))];

		_towns = nearestLocations [_position, ["NameVillage","NameCity","NameCityCapital"], 10000];

		_town = _towns select 0;

		_position = getPos _town;

		_nearRoads = _position nearRoads 500;

		_road = _nearRoads call BIS_fnc_selectRandom;

		if !(count (nearestObjects [getPos _road,["Man"],500]) > 0) then
		{
			_temp = 1;
		};
	};


	_roadConnectedTo = roadsConnectedTo _road;
	_connectedRoad = _roadConnectedTo select 0;
	_dir = [_road, _connectedRoad] call BIS_fnc_DirTo;

	_position = getPos _road;

	_r = 3 + random 2;

	_position = [(_position select 0) + (_r*sin(_dir + 90)),(_position select 1) + (_r*cos(_dir + 90))];

	_obj = createMine [(_ieds call BIS_fnc_selectRandom), _position, [], 0];
	_obj setDamage 0.99;
	east  revealMine _obj;
	tf47_var_iedTracker pushBack _obj;

	_obj = createMine [(_explosives call BIS_fnc_selectRandom), _position, [], 0];
	_obj setDir (_dir - 90);
	_obj setDamage 0.5;
	_obj hideObjectGlobal true;
	east  revealMine _obj;
	tf47_var_iedTracker pushBack _obj;
};