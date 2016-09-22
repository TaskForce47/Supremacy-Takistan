tf47_capVeh1Num = CapVeh1 addAction ["Activate explosive charge", { sideChat "Sargel set! Explosion in 40 seconds!"; sleep 40; "Bo_GBU12_LGB_MI10" createVehicle [position CapVeh1]; }];


CapVeh1 addEventHandler ["Killed", { removeAction tf47_capVeh1Num; } ];