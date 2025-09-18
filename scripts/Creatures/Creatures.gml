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
	array_push(global.salamander.moves, Move.Fireball, Move.None, Move.None, Move.None);
	array_push(global.salamander.passiveAbilities, PassiveAbility.None, PassiveAbility.None, PassiveAbility.None);
	
	global.griffin = get_creature_template();
	global.griffin.speed = 200;
	array_push(global.griffin.moves, Move.None, Move.None, Move.None, Move.None);
	array_push(global.griffin.passiveAbilities, PassiveAbility.None, PassiveAbility.None, PassiveAbility.None);
	
	global.sphinx = get_creature_template();
	global.sphinx.speed = 250;
	array_push(global.sphinx.moves, Move.None, Move.None, Move.None, Move.None);
	array_push(global.sphinx.passiveAbilities, PassiveAbility.None, PassiveAbility.None, PassiveAbility.None);
	
	global.ent = get_creature_template();
	global.ent.speed = 300;
	array_push(global.ent.moves, Move.None, Move.None, Move.None, Move.None);
	array_push(global.ent.passiveAbilities, PassiveAbility.None, PassiveAbility.None, PassiveAbility.None);
	
	global.gorgon = get_creature_template();
	global.gorgon.speed = 350;
	array_push(global.gorgon.moves, Move.None, Move.None, Move.None, Move.None);
	array_push(global.gorgon.passiveAbilities, PassiveAbility.None, PassiveAbility.None, PassiveAbility.None);
	
	global.elf = get_creature_template();
	global.elf.speed = 400;
	array_push(global.elf.moves, Move.None, Move.None, Move.None, Move.None);
	array_push(global.elf.passiveAbilities, PassiveAbility.None, PassiveAbility.None, PassiveAbility.None);
	
	global.dwarf = get_creature_template();
	global.dwarf.speed = 450;
	array_push(global.dwarf.moves, Move.None, Move.None, Move.None, Move.None);
	array_push(global.dwarf.passiveAbilities, PassiveAbility.None, PassiveAbility.None, PassiveAbility.None);
	
	global.vampire = get_creature_template();
	global.vampire.speed = 500;
	array_push(global.vampire.moves, Move.None, Move.None, Move.None, Move.None);
	array_push(global.vampire.passiveAbilities, PassiveAbility.None, PassiveAbility.None, PassiveAbility.None);
}