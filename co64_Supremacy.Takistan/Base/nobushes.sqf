//////////////// Exit if not server /////////////////////////////////////////////////////////////////////////////////////////////
//if(!([] call TF47_Helper_fnc_checkForHc)) exitwith {};
if (!isServer) exitWith {};
private ["_basepos"];
_basepos = getMarkerPos "mkr_Base";
{(_basepos nearestObject _x) hideObjectGlobal true;
} forEach [
403120,
403121,
403122,
403128,
403129,
403130,
403131,
403132,
403133,
403134,
403135,
403136,
403137,
403138,
403139,
416429,
416430,
204701,
204702,
204703,
204704,
204705,
408241,
402998,
204712,
204713,
204714,
204715,
204716,
204717,
204718,
204719,
204720,
204721,
204722,
204723,
204724,
204725,
204726,
204727,
204728,
204729,
204730,
204731,
204732,
204733,
204734,
204735,
204736,
204737,
204738,
204739,
204740,
204741,
204742,
204743,
204744,
204745,
204746,
204747,
204748,
204749,
204750,
204751,
204752,
204753,
204754,
204755,
204756,
204757,
204758,
204759,
204760,
204771,
204774,
204775,
204698,
204699,
408242,
408243,
408257,
408357,
123390,
123391,
123392,
123393,
123394,
123395,
196976,
196977,
196978,
196979,
196980,
196981,
196982,
196983,
196984,
196985,
196986,
196987,
196988,
196989,
197000,
416356,
416431,
416432,
416433,
416434
];


