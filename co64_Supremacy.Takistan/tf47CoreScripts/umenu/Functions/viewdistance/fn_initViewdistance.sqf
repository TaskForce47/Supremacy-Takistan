
viewDistanceFoot = profileNamespace getVariable ["tf47_core_umenu_vd_saved_vdFoot", viewDistance];
viewDistanceCar = profileNamespace getVariable ["tf47_core_umenu_vd_saved_vdCar", viewDistance];
viewDistanceAir = profileNamespace getVariable ["tf47_core_umenu_vd_saved_vdAir", viewDistance];
viewDistanceObject = profileNamespace getVariable ["tf47_core_umenu_vd_saved_vdObject", (getObjectViewDistance select 0)];
terrainMode = profileNamespace getVariable ["tf47_core_umenu_vd_saved_terrainMode", "norm"];

[] spawn
{
	waitUntil {!(isNull player) && (player == player)};
	waitUntil{!(isNil "BIS_fnc_init")};
	waitUntil {!(isNull (findDisplay 46))};

	[] spawn tf47_core_umenu_vd_fnc_trackViewMode;
};