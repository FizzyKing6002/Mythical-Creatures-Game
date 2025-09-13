if ( creatureNum < 4 && localHostObj.combatData.blueBenchNum == creatureNum + 1 ) then exit;
if ( creatureNum >= 4 && localHostObj.combatData.redBenchNum == creatureNum mod 4 + 1 ) then exit;

draw_self();