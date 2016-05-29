if(isNil "westTickets") then {
	ctrlSetText [1003, "				N/A"];
} else {
	ctrlSetText [1003, "				" + str westTickets]; 
};

ctrlSetText [1004, ""];