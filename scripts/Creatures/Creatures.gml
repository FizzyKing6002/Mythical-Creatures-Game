function init_creatures ()
{
	var get_creature_template = function ()
	{
		var _creatureTemplate =
		{
			displayName : "Creature",
			modelSprite : spr_missing_64,
			iconSprite : spr_missing_32,
			
			hp : 0,
			speed : 0,
			
			moves : [],
			passiveAbilities : [],
			activeAbility : ActiveAbility.None,
		};
		return _creatureTemplate;
	}
	
	
	
	global.salamander = get_creature_template();
	global.salamander.displayName = "Salamander";
	global.salamander.modelSprite = spr_salamander_model;
	global.salamander.iconSprite = spr_salamander_icon;
	global.salamander.hp = 500;
	global.salamander.speed = 150;
	array_push(global.salamander.moves, Move.Fireball);
	
	global.griffin = get_creature_template();
	global.griffin.speed = 130;
	
	global.sphinx = get_creature_template();
	global.sphinx.speed = 110;
	
	global.ent = get_creature_template();
	global.ent.speed = 90;
	
	global.gorgon = get_creature_template();
	global.gorgon.speed = 70;
	
	global.elf = get_creature_template();
	global.elf.speed = 50;
	
	global.dwarf = get_creature_template();
	global.dwarf.speed = 30;
	
	global.vampire = get_creature_template();
	global.vampire.speed = 10;
}