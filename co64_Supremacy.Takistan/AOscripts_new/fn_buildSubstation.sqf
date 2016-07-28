 /*
------------------------------------------------------------------------------------
by: "[TF47] TaskForce 47"

creates a transformer substation near the main target at a random road position

parameter: none
------------------------------------------------------------------------------------
*/

/*
Grab data:
Mission: Domination
World: Takistan
Anchor position: [3689.9, 4549.91]
Area size: 150
Using orientation of objects: yes

[
	["CUP_A2_l1_gate_ep1",[2.23877,4.89746,0.206665],37.9964,1,0,[-0.312299,-3.61593],"","",true,false], 
	["CUP_A2_l2_5m_end_ep1",[-1.04004,7.44971,-3.05176e-005],216.549,1,0,[0.256593,3.4979],"","",true,false], 
	["Land_SolarPanel_1_F",[7.12744,4.38525,-0.0170593],170.527,1,0,[2.34996,0.724386],"","",true,false], 
	["CUP_A2_l1_pillar_ep1",[-3.10181,9.05664,1.52588e-005],127.215,1,0,[3.57337,-0.160403],"","",true,false], 
	["Land_TBox_F",[0.815186,11.5298,0.047287],34.53,1,0,[0,0],"","",true,false], 
	["CUP_A2_l2_5m_ep1",[-1.6499,11.4531,0.00369263],121.271,1,0.00315313,[3.45958,-0.577669],"","",true,false], 
	["CUP_A2_house_c_5_ep1",[10.479,5.14893,0],215.443,1,0,[1.1538,2.17154],"","",true,false], 
	["CUP_A2_l_2m5_ep1",[1.97266,12.6504,-0.150467],214.224,1,0,[0.780267,3.41249],"","",true,false], 
	["CUP_A2_l1_pillar_ep1",[-0.381836,13.4263,0],34.344,1,0,[-0.395248,-3.15578],"","",true,false], 
	["CUP_A2_l_2m5_gate_ep1",[4.60376,11.3384,0.032196],122.425,1,0.000146043,[3.07741,-1.08398],"","",true,false], 
	["Land_PowLines_Transformer_F",[11.7292,7.2334,0.550629],303.738,1,0,[0,0],"","",true,false], 
	["Land_spp_Transformer_F",[10.895,10.7383,-0.00341797],304.774,1,0,[0,0],"","",true,false], 
	["Land_PowerGenerator_F",[8.05029,12.8945,0.00125122],216.139,1,0,[0.586552,2.92507],"","",true,false], 
	["CUP_A2_l1_5m_ep1",[1.5105,16.3408,-0.0218506],122.844,1,0,[3.14439,-0.477786],"","",true,false], 
	["CUP_A2_l_2m5_ep1",[7.72827,15.2705,-0.019577],305.29,1,0,[-2.91608,0.629884],"","",true,false], 
	["Land_Wall_Tin_4",[9.20947,13.5762,-0.0931244],213.583,1,0,[0,0],"","",true,false], 
	["Land_dp_transformer_F",[4.6145,15.5718,0.00473022],213.385,1,0,[0,0],"","",true,false], 
	["Land_Wall_Tin_4_2",[12.5476,11.2588,-0.0883789],218.23,1,0,[0,0],"","",true,false], 
	["CUP_A2_l1_pillar_ep1",[1.99731,17.1665,1.52588e-005],215.094,1,0,[0.481626,3.13831],"","",true,false], 
	["CUP_A2_l1_pillar_ep1",[7.83203,16.0278,-1.52588e-005],32.284,1,0,[-1.16125,-2.79375],"","",true,false], 
	["CUP_A2_l1_2m5_ep1",[2.59351,18.0239,-0.000595093],304.154,1,0,[-3.13001,0.533095],"","",true,false], 
	["CUP_A2_l1_5m_ep1",[4.56299,18.1772,-0.12114],32.3229,1,0,[-1.15935,-2.79453],"","",true,false], 
	["CUP_A2_l1_pillar_ep1",[3.41602,19.0078,0],32.9546,1,0,[-0.368021,-2.96879],"","",true,false]
]

*/



_aoPos = param [0, [0,0,0]];
_missionHandle = param [1, 0]; 
 
_nearRoads = (_aoPos nearRoads 2000) - (_aoPos nearRoads 800);

_nearRoads = _nearRoads call BIS_fnc_arrayShuffle;

_location = [0,0];
_dir = 0;
_angle = 0;

if (count _nearRoads < 1) exitWith {};

{
	_road = _x;

	_roadConnectedTo = roadsConnectedTo _road;
	
	if (count _roadConnectedTo > 0) then
	{
	_connectedRoad = _roadConnectedTo select 0;
	_dir = [_road, _connectedRoad] call BIS_fnc_DirTo;

	_roadPos = getPos _road;

	_center1 = [(_roadPos select 0) + 15*sin(_dir+90),(_roadPos select 1) + 15*cos(_dir+90)];
	_center2 = [(_roadPos select 0) + 15*sin(_dir-90),(_roadPos select 1) + 15*cos(_dir-90)];

	if ([_center1, (_dir + 90), 50, 30, 2, []] call tf47_fnc_isFlatEmpty == 1) then
	{
		_angle = _dir;
		_location = _roadPos;
	};
	if ([_center2, (_dir - 90), 50, 30, 2, []] call tf47_fnc_isFlatEmpty == 1) then
	{
		_angle = _dir + 180;
		_location = _roadPos;
	};
	};
} forEach _nearRoads;

if (_location isEqualTo [0,0]) exitWith {};

_comp=[
	["CUP_A2_l1_gate_ep1",[2.23877,4.89746,0.206665],37.9964,1,0,[],format[subStationPart1_%1,_missionHandle],"",true,false],
	["CUP_A2_l2_5m_end_ep1",[-1.04004,7.44971,-3.05176e-005],216.549,1,0,[],format[subStationPart2_%1,_missionHandle],"",true,false],
	["Land_SolarPanel_1_F",[7.12744,4.38525,3.02],170.527,1,0,[],format[subStationPart3_%1,_missionHandle],"thissetDir180;",true,false],
	["CUP_A2_l1_pillar_ep1",[-3.10181,9.05664,1.52588e-005],127.215,1,0,[],format[subStationPart4_%1,_missionHandle],"",true,false],
	["Land_TBox_F",[0.815186,11.5298,0.047287],34.53,1,0,[],format[subStationPart5_%1,_missionHandle],"",true,false],
	["CUP_A2_l2_5m_ep1",[-1.6499,11.4531,0.00369263],121.271,1,0.00315313,[],format[subStationPart6_%1,_missionHandle],"",true,false],
	["CUP_A2_house_c_5_ep1",[10.479,5.14893,0],215.443,1,0,[],format[subStationPart7_%1,_missionHandle],"",true,false],
	["CUP_A2_l_2m5_ep1",[1.97266,12.6504,-0.150467],214.224,1,0,[],format[subStationPart8_%1,_missionHandle],"",true,false],
	["CUP_A2_l1_pillar_ep1",[-0.381836,13.4263,0],34.344,1,0,[],format[subStationPart9_%1,_missionHandle],"",true,false],
	["CUP_A2_l_2m5_gate_ep1",[4.60376,11.3384,0.032196],122.425,1,0.000146043,[],format[subStationPart10_%1,_missionHandle],"",true,false],
	["Land_PowLines_Transformer_F",[11.7292,7.2334,0.550629],303.738,1,0,[],format[subStationPart11_%1,_missionHandle],"",true,false],
	["Land_spp_Transformer_F",[10.895,10.7383,-0.00341797],304.774,1,0,[],format[subStationPart12_%1,_missionHandle],"",true,false],
	["Land_PowerGenerator_F",[8.05029,12.8945,0.00125122],216.139,1,0,[],format[subStationPart13_%1,_missionHandle],"",true,false],
	["CUP_A2_l1_5m_ep1",[1.5105,16.3408,-0.0218506],122.844,1,0,[],format[subStationPart14_%1,_missionHandle],"",true,false],
	["CUP_A2_l_2m5_ep1",[7.72827,15.2705,-0.019577],305.29,1,0,[],format[subStationPart15_%1,_missionHandle],"",true,false],
	["Land_Wall_Tin_4",[9.20947,13.5762,-0.0931244],213.583,1,0,[],format[subStationPart16_%1,_missionHandle],"",true,false],
	["Land_dp_transformer_F",[4.6145,15.5718,0.00473022],213.385,1,0,[],format[subStationPart17_%1,_missionHandle],"",true,false],
	["Land_Wall_Tin_4_2",[12.5476,11.2588,-0.0883789],218.23,1,0,[],format[subStationPart18_%1,_missionHandle],"",true,false],
	["CUP_A2_l1_pillar_ep1",[1.99731,17.1665,1.52588e-005],215.094,1,0,[],format[subStationPart19_%1,_missionHandle],"",true,false],
	["CUP_A2_l1_pillar_ep1",[7.83203,16.0278,-1.52588e-005],32.284,1,0,[],format[subStationPart20_%1,_missionHandle],"",true,false],
	["CUP_A2_l1_2m5_ep1",[2.59351,18.0239,-0.000595093],304.154,1,0,[],format[subStationPart21_%1,_missionHandle],"",true,false],
	["CUP_A2_l1_5m_ep1",[4.56299,18.1772,-0.12114],32.3229,1,0,[],format[subStationPart22_%1,_missionHandle],"",true,false],
	["CUP_A2_l1_pillar_ep1",[3.41602,19.0078,0],32.9546,1,0,[],format[subStationPart23_%1,_missionHandle],"",true,false]
];	
	

[_location, _angle+55, _comp] call BIS_fnc_ObjectsMapper;

nul = [sub7,2,true,2,[2,2],50,"default",nil,nil,nil] execVM "LV\fillHouse.sqf";
nul = [sub7,2,50,[true,false],[true,false,false],false,[10,0],[0,0],"default",nil,nil,nil] execVM "LV\militarize.sqf";
nul = [sub7,2,50,[true,false],[true,false,true],true,[0,0],[1,0],"default",nil,nil,nil] execVM "LV\militarize.sqf";

// add to AO cleanup array ... 

{
	(tf47_supremacy_main_var_AOUnits select _missionHandle) pushback _x;
} foreach [sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8, sub9, sub10, sub11, sub12, sub13, sub14, sub15, sub16, sub17, sub18, sub19, sub20, sub21, sub22, sub23];



_substationmarker = createMarker ["substationmarker",_location];
_substationmarker setMarkerText "Transformer";
_substationmarker setMarkerType "hd_dot";

//todo Wrong
(tf47_supremacy_main_var_Marker select _missionHandle) pushBack _substationmarker;

["Sidemission_new"] remoteExec ["SEPP_fnc_globalsound",0,false];

_missionText = format
	[
		"<t align='center' size='1.5'>New Additional Mission available!</t><br/><t size='1' align='center' color='#0040FF'>%1</t>",
		"A guarded transformer substation has been spottet near the main Target. Destroying it will turn of all the lights near the AO and may give you a tactical advantage."
	];
[_missionText] remoteExec ["SEPP_fnc_globalHint",0,false];

["tsk1000", true, ["A guarded transformer substation has been spottet near the main Target. Destroying it will turn of all the lights near the AO and may give you a tactical advantage.","Additional Mission: Transformer","Additional Mission"],_location, "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;

_power_trig1 = createTrigger 				["EmptyDetector", _location];
_power_trig1 setTriggerArea 				[0, 0, false];  
_power_trig1 setTriggerActivation 			["ANY", "notpresent", true];   
_power_trig1 setTriggerStatements 			["(!alive sub16) || (!alive sub11)", "[_aoPos, 1000, 0.95] spawn TF47_fnc_lightOut; ['Sidemission_complete'] remoteExec ['SEPP_fnc_globalsound',0,false]; [""tsk1000"", true, ['A guarded transformer substation has been spottet near the main Target. Destroying it will turn of all the lights near the AO and may give you a tactical advantage.','Additional Mission: Transformer','Additional Mission'],getPos sub1, ""SUCCEEDED"", 1, true, true,"""",true] call BIS_fnc_setTask; deletevehicle thisTrigger" , ""];

