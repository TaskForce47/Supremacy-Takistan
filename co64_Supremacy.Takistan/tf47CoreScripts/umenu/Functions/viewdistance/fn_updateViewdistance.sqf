
_target = vehicle player;
switch (true) do
{
	case (_target isKindOf "Man"): {
		setViewDistance viewDistanceFoot;
	};
	case ((_target isKindOf "LandVehicle") || (_target isKindOf "Ship")): {
		setViewDistance viewDistanceCar;
	};
	case (_target isKindOf "Air"): {
		setViewDistance viewDistanceAir;

	};
};
