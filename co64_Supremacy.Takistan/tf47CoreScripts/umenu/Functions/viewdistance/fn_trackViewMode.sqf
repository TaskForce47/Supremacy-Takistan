private["_oldPlayer"];
while {true} do
{
	_oldPlayer = vehicle player;
	if(!(alive player)) then
	{
		waitUntil {(alive player)};
	};
	[] call tf47_core_umenu_vd_fnc_updateViewDistance;
	waitUntil {(_oldPlayer != vehicle player) || !(alive player)};
};