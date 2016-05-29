if (hasInterface) then {	
		
	waitUntil {time >= 0.5};
	disableSerialization;
	//Abort Option
	//Spacebar_pressed = _display displayAddEventHandler ["KeyDown",{_this execVM "intro\killintro.sqf"}];
	// Preparing the CamerashowCinemaBorder true;
	playMusic "LeadTrack01b_F";
	5 fadeMusic 1;
	_camera = "camera" camcreate [-89196.10,10716.95,-17576.63];
	_camera cameraEffect ["internal","back"];
	//;comment "20:19:08";
	_camera camPrepareTarget [-75548.52,-45564.98,25741.85];
	_camera camPreparePos [8485.60,1969.34,0.28];
	_camera camPrepareFOV 0.010;
	_camera camCommitPrepared 0;
	waitUntil {camCommitted _camera;};
	//;comment "20:20:38";No Trespassing Sign
	_camera camPrepareTarget [-87971.44,-21199.99,12307.13];
	_camera camPreparePos [8485.60,1969.34,0.28];
	_camera camPrepareFOV 0.245;
	_camera camCommitPrepared 5;
	waitUntil {camCommitted _camera;};
	sleep 4;
	//;comment "18:02:17"; "Planes"
	_camera camPrepareTarget [36692.16,90062.74,-37060.33];
	_camera camPreparePos [8123.76,1758.33,22.36];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 10;
	waitUntil {camCommitted _camera;};
	sleep 2;
	//;comment "18:03:36";cars
	_camera camPrepareTarget [-89170.07,22280.23,-9721.69];
	_camera camPreparePos [8236.77,1959.96,23.09];
	_camera camPrepareFOV 0.202;
	_camera camCommitPrepared 10;
	waitUntil {camCommitted _camera;};
	sleep 2;
	//;comment "18:04:01";helis
	_camera camPrepareTarget [65524.11,78132.61,-30091.81];
	_camera camPreparePos [8236.77,1959.96,23.09];
	_camera camPrepareFOV 0.202;
	_camera camCommitPrepared 10;
	waitUntil {camCommitted _camera;};
	sleep 2;
	//;comment "18:04:50";spawn
	_camera camPrepareTarget [23691.31,100232.23,10356.13];
	_camera camPreparePos [8236.77,1959.96,23.09];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 10;
	waitUntil {camCommitted _camera;};
	// Focus on Player
	_camera camSetTarget Player;
	_camera camPrepareTarget Player;
	_camera camSetFocus [50, 1];
	_camera camCommitPrepared 1;
	waitUntil {camCommitted _camera;};
	// Zoom in on Player
	_camera camPrepareFOV 0.009;
	_camera CamCommit 5;
	sleep 4;
	_camera cameraEffect ["terminate","back"];
	titleText ["Ende","BLACKIN",0];
	10 fadeMusic 0;
	showCinemaBorder false;
	camDestroy _camera;
};