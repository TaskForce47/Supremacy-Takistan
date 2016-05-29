hint composeText ["Bau gestartet. Bitte bleiben Sie von der Baustelle entfernt.", lineBreak, lineBreak, "Construction started. Please stay away until it is finished."];

for [{_i=0}, {_i<4}, {_i=_i+1}] do
{
    fobtable say3D "buildingFOB";
    sleep 4.5;
};

sleep 10;

hint composeText ["Bau abgeschlossen.", lineBreak, lineBreak, "Construction finished."];