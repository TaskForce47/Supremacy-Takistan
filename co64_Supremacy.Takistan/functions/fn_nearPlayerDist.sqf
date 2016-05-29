_position = _this select 0;
_minDist = 100000;

{
	_Dist= (_x distance _position);
	if (_Dist<_minDist) then
	{
		_minDist = _Dist;
	};
} forEach allPlayers;

_minDist