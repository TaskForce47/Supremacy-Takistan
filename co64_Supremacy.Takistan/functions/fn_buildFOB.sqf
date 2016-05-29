/*
Grab data:
Mission: co64_Domination_v0_2_4sdsd_r
World: Takistan
Anchor position: [6154.43, 11629.4]
Area size: 100
Using orientation of objects: yes

[
	["Land_BagBunker_Small_F",[3.26953,0.386719,0],129.891,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_1_F",[2.91455,-3.08105,0.0549774],40.3054,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_3_F",[1.55811,-4.50293,0],313.531,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_1_F",[1.729,-4.36719,0.0160599],30.2168,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[-0.0742188,-5.68066,-0.000999451],137.5,1,0,[0,-0],"","",true,false], 
	["Land_CncWall1_F",[0.736328,-5.73633,0],157.065,1,0,[0,-0],"","",true,false], 
	["Land_CncWall4_F",[-1.66846,-8.03906,0],132.914,1,0,[0,-0],"","",true,false], 
	["Land_BagFence_Long_F",[-2.46143,-7.9668,0],312.719,1,0,[0,-0],"","",true,false], 
	["Land_Mil_WallBig_4m_F",[2.09717,-8.10059,-0.01194],223.953,1,0,[0,0],"","",true,false], 
	["Land_BarGate_F",[6.36963,1.08008,0],132.29,1,0,[0,-0],"","",true,false], 
	["Land_BagFence_Long_F",[-4.12061,-9.69238,-0.000999451],312.719,1,0,[0,-0],"","",true,false], 
	["Land_Cargo_Patrol_V3_F",[0.0634766,-9.69922,0],134.472,1,0,[0,-0],"","",true,false], 
	["Land_Mil_WallBig_Corner_F",[6.12402,-9.66211,0],227.729,1,0,[0,0],"","",true,false], 
	["Land_CncWall1_F",[-3.73047,-10.5098,0],124.688,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrier_F",[-7.30957,-9.66113,0],223.132,1,0,[0,0],"","",true,false], 
	["Land_Mil_WallBig_4m_F",[-2.85254,-12.7363,-0.01194],45.2223,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[6.12402,-11.6514,0.00485229],121.523,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierBig_F",[-2.78516,-14.0264,0],226.456,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[13.0923,-5.93359,-0.000999451],309.228,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[7.22705,-12.5225,0.0173035],131.612,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_3_F",[12.1733,7.6416,0],42.6987,1,0,[0,0],"","",true,false], 
	["Land_Cargo_House_V3_F",[13.2422,-8.4834,0],131.667,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[5.84033,-11.3652,0],40.3174,1,0,[0,0],"","",true,false], 
	["Land_CncWall1_F",[14.3145,-5.08398,0],215.469,1,0,[0,0],"","",true,false], 
	["Land_Mil_WallBig_4m_F",[-0.00439453,-15.5615,-0.01194],45.2223,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[8.45117,-13.8057,0.016777],131.612,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[14.8853,5.29004,0],40.3174,1,0,[0,0],"","",true,false], 
	["Land_Mil_WiredFence_F",[16.2607,5.26758,-7.62939e-006],219.856,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[16.791,-7.0332,0],220.86,1,0,[0,0],"","",true,false],
	["Land_CncWall4_F",[13.498,-14.3301,0],322.961,1,0,[0,0],"","",true,false],
	["Land_CncWall4_F",[17.3447,-10.8896,0],311.819,1,0,[0,0],"","",true,false],
	["Land_HBarrierBig_F",[3.55078,-20.1367,0],224.195,1,0,[0,0],"","",true,false], 
	["Land_CncShelter_F",[11.1577,-17.459,0],62.8976,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[19.3223,1.59668,0],41.7827,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[21.7305,-5.16602,0],130.432,1,0,[0,-0],"","",true,false], 
	["Land_Mil_WiredFence_F",[22.4238,-0.0517578,-7.62939e-006],219.856,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[15.6763,-16.1572,0],95.1018,1,0,[0,-0],"","",true,false], 
	["Land_Mil_WiredFence_F",[22.7358,-5.48535,-7.62939e-006],308.376,1,0,[0,0],"","",true,false], 
	["Land_HBarrierBig_F",[10.2017,-21.6875,0],319.636,1,0,[0,-0],"","",true,false]
]

*/

if (tf47_var_FOBStatus == 1) exitWith {};

tf47_var_FOBStatus = 1;
publicVariable "tf47_var_FOBStatus";

private ["_location","_dir","_comp"];

params ["_location","_dir"];

fobContainer1 setPos [-10,-10];
sleep 0.5;
fobContainer2 setPos [-20,-20];
sleep 0.5;
fobContainer3 setPos [-30,-30];
sleep 0.5;

[_location, _dir-40, [["Land_Workbench_01_F",[3.4,-4.45,0],310.891,1,0,[],"fobtable","",true,false]]] call BIS_fnc_ObjectsMapper;

/*
_comp = [
	["FlagSmall_F",[22.4238,-0.0517578,-7.62939e-006],219.856,1,0,[0,0],"fobflag1","",true,false], 
	["FlagSmall_F",[15.6763,-16.1572,0],95.1018,1,0,[0,-0],"fobflag2","",true,false], 
	["FlagSmall_F",[22.7358,-5.48535,-7.62939e-006],308.376,1,0,[0,0],"fobflag3","",true,false], 
	["FlagSmall_F",[10.2017,-21.6875,0],319.636,1,0,[0,-0],"fobflag4","",true,false]
];

[_location, _dir-40, _comp] call BIS_fnc_ObjectsMapper;
*/

while {count ( [(_location select 0) + 8*sin(90+_dir),(_location select 1) + 8*cos(90+_dir)] nearEntities ["Man", 15]) >0 } do
{
	{
		if (_x distance fobtable < 15) then
		{
			(composeText ["Bitte entfernen Sie sich von der Baustelle.", lineBreak, lineBreak, "Please leave the construction site."]) remoteExecCall ["hint", _x];
		};
	} forEach allPlayers;

	sleep 4;
};

{
	if (_x distance fobtable <150) then
	{
		remoteExec ['tf47_fnc_buildFOBlocal', _x];
	};
} forEach allPlayers;

_comp = [
	["Land_fortified_nest_small_EP1",[3.26953,0.386719,0],129.891,1,0,[],"fob2","this setvariable ['ace_medical_isMedicalFacility', true];",true,false], 
	["Land_HBarrier_3_F",[1.55811,-4.50293,0],313.531,1,0,[0,-0],"fob3","",true,false], 
	["Land_BagFence_Long_F",[-0.0742188,-5.68066,-0.000999451],137.5,1,0,[],"fob4","this setVectorUp (surfaceNormal (position this));",true,false], 
	["Land_CncWall1_F",[0.736328,-5.73633,0],157.065,1,0,[0,-0],"fob5","",true,false], 
	["Land_CncWall4_F",[-1.66846,-8.03906,0],132.914,1,0,[0,-0],"fob6","",true,false], 
	["Land_BagFence_Long_F",[-2.46143,-7.9668,-0.000999451],312.719,1,0,[],"fob7","this setVectorUp (surfaceNormal (position this));",true,false], 
	["Land_Mil_WallBig_4m_F",[2.09717,-8.10059,-0.01194],223.953,1,0,[0,0],"fob8","",true,false], 
	["Land_BarGate_F",[6.36963,1.08008,0],132.29,1,0,[],"fob9","",true,false], 
	["Land_BagFence_Long_F",[-4.12061,-9.69238,-0.000999451],312.719,1,0,[],"fob10","this setVectorUp (surfaceNormal (position this));",true,false], 
	["Land_Cargo_Patrol_V3_F",[0.0634766,-9.69922,0],134.472,1,0,[0,-0],"fob11","",true,false], 
	["Land_Mil_WallBig_Corner_F",[6.12402,-9.66211,0],227.729,1,0,[0,0],"fob12","",true,false], 
	["Land_CncWall1_F",[-3.73047,-10.5098,0],124.688,1,0,[0,-0],"fob13","",true,false], 
	["Land_CncBarrier_F",[-7.30957,-9.66113,0],223.132,1,0,[],"fob14","",true,false], 
	["Land_Mil_WallBig_4m_F",[-2.85254,-12.7363,-0.01194],45.2223,1,0,[0,0],"fob15","",true,false], 
	["Land_HBarrierBig_F",[-2.78516,-14.0264,0],226.456,1,0,[0,0],"fob16","",true,false], 
	["Land_BagFence_Long_F",[13.0923,-5.93359,-0.000999451],309.228,1,0,[],"fob17","this setVectorUp (surfaceNormal (position this));",true,false], 
	["Land_HBarrier_3_F",[12.1733,7.6416,0],42.6987,1,0,[0,0],"fob18","",true,false], 
	["Land_Cargo_House_V3_F",[13.2422,-8.4834,0],131.667,1,0,[0,-0],"fob19","",true,false], 
	["Land_HBarrier_5_F",[5.84033,-11.3652,0],40.3174,1,0,[0,0],"fob20","",true,false], 
	["Land_CncWall1_F",[14.3145,-5.08398,0],215.469,1,0,[0,0],"fob21","",true,false], 
	["Land_Mil_WallBig_4m_F",[-0.00439453,-15.5615,-0.01194],45.2223,1,0,[0,0],"fob22","",true,false], 
	["Land_HBarrier_5_F",[14.8853,5.29004,0],40.3174,1,0,[0,0],"fob23","",true,false], 
	["Land_Mil_WiredFence_F",[16.2607,5.26758,-7.62939e-006],219.856,1,0,[0,0],"fob24","",true,false], 
	["Land_CncWall4_F",[16.791,-7.0332,0],220.86,1,0,[0,0],"fob25","",true,false], 
	["Land_CncWall4_F",[13.498,-14.3301,0],322.961,1,0,[0,0],"fob26","",true,false], 
	["Land_CncWall4_F",[17.3447,-10.8896,0],311.819,1,0,[0,0],"fob27","",true,false], 
	["Land_HBarrierBig_F",[3.55078,-20.1367,0],224.195,1,0,[0,0],"fob28","",true,false], 
	["Land_CncShelter_F",[11.1577,-17.459,0],62.8976,1,0,[0,0],"fob29","",true,false], 
	["Land_HBarrier_5_F",[19.3223,1.59668,0],41.7827,1,0,[0,0],"fob30","",true,false], 
	["Land_HBarrier_Big_F",[21.7305,-5.16602,0],130.432,1,0,[0,-0],"fob31","",true,false], 
	["Land_Mil_WiredFence_F",[22.4238,-0.0517578,-7.62939e-006],219.856,1,0,[0,0],"fob32","",true,false], 
	["Land_CncBarrier_F",[15.6763,-16.1572,0],95.1018,1,0,[],"fob33","",true,false], 
	["Land_Mil_WiredFence_F",[22.7358,-5.48535,-7.62939e-006],308.376,1,0,[0,0],"fob34","",true,false], 
	["MASH_EP1",[5.12402,-16.6514,0],311.523,1,0,[],"fob1","this allowDamage false; this setDamage 0;",true,false],
	["Land_HBarrier_1_F",[2.91455,-3.08105,1],40.3054,1,1,[0,0],"fob35","",true,false],
	["Land_HBarrier_1_F",[1.729,-4.36719,1],30.2168,1,1,[0,0],"fob36","",true,false],
	["Land_HBarrier_1_F",[7.22705,-12.5225,1],131.612,1,1,[0,-0],"fob37","",true,false],
	["Land_HBarrier_1_F",[8.45117,-13.8057,0.7],131.612,1,1,[0,0],"fob38","",true,false],
	["Land_HBarrier_1_F",[6.12402,-11.6514,1],121.523,1,1,[0,-0],"fob39","",true,false],  
	["Land_HBarrierBig_F",[10.2017,-21.6875,0],319.636,1,0,[0,-0],"fob40","",true,false]
];

{
	[_location, _dir-40, [_x]] call BIS_fnc_ObjectsMapper;
	sleep 0.5;

} forEach _comp;

_padPos = _location findEmptyPosition [10,50,"Land_HelipadCircle_F"];
fobhelipad = createVehicle ["Land_HelipadCircle_F", _padPos, [], 0, "NONE"];
fobhelipad enablesimulationglobal false;

fobmarker = createMarker ["fobmarker",_location];
fobmarker setMarkerText "F.O.B. Knight";
fobmarker setMarkerType "flag_NATO";

deleteVehicle fobtable;

//[_location, _dir-40, [["Land_Workbench_01_F",[3.4,-4.45,0],310.891,1,0,[],"fobtable","this addAction ['remove F.O.B.', '[] remoteExec [""tf47_fnc_removeFOB"", 2];'];",true,false]]] call BIS_fnc_ObjectsMapper;
[_location, _dir-40, [["Land_Workbench_01_F",[3.4,-4.45,0],310.891,1,0,[],"fobtable","",true,false]]] call BIS_fnc_ObjectsMapper;

[fobtable, "remove F.O.B.", "[] remoteExec [""tf47_fnc_removeFOB"", 2];"] remoteExecCall ["tf47_fnc_addAction", 0];

tf47_var_FOBStatus = 2;
publicVariable "tf47_var_FOBStatus";