private ["_objects"];

_objects = [allMissionObjects "CraterLong"] + [allMissionObjects "WeaponHolder"] + [allMissionObjects "WeaponHolderSimulated"];

hint format ["count: %1", count tf47_var_objectTracker];

{
    if ((_x select 0) in tf47_var_objectTracker) then
    {
        deleteVehicle (_x select 0);
        tf47_var_objectTracker = tf47_var_objectTracker - [_x];
        hint format ["remove %1", (_x select 0)];
    }
    else
    {
        tf47_var_objectTracker pushBack (_x select 0);
        hint format ["add  %1", (_x select 0)];
    };
} forEach _objects;