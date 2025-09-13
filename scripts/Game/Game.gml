function get_model_sprite_by_creature (_identifier)
{
	switch _identifier
	{
		case Creature.Salamander: return spr_salamander_model;
		case Creature.Griffin: return spr_griffin_model;
		case Creature.Sphinx: return spr_sphinx_model;
		case Creature.Ent: return spr_ent_model;
		case Creature.Gorgon: return spr_gorgon_model;
		case Creature.Elf: return spr_elf_model;
		case Creature.Dwarf: return spr_dwarf_model;
		case Creature.Vampire: return spr_vampire_model;
		default: show_debug_message("No icon for unknown creature..."); return spr_missing_64;
	}
}

function get_icon_sprite_by_creature (_identifier)
{
	switch _identifier
	{
		case Creature.Salamander: return spr_salamander_icon;
		case Creature.Griffin: return spr_griffin_icon;
		case Creature.Sphinx: return spr_sphinx_icon;
		case Creature.Ent: return spr_ent_icon;
		case Creature.Gorgon: return spr_gorgon_icon;
		case Creature.Elf: return spr_elf_icon;
		case Creature.Dwarf: return spr_dwarf_icon;
		case Creature.Vampire: return spr_vampire_icon;
		default: show_debug_message("No icon for unknown creature..."); return spr_missing_32;
	}
}

function get_creature_data (_identifier)
{
	switch _identifier
	{
		case Creature.Salamander: return global.salamander;
		case Creature.Griffin: return global.griffin;
		case Creature.Sphinx: return global.sphinx;
		case Creature.Ent: return global.ent;
		case Creature.Gorgon: return global.gorgon;
		case Creature.Elf: return global.elf;
		case Creature.Dwarf: return global.dwarf;
		case Creature.Vampire: return global.vampire;
		default: show_debug_message("Creature not accounted for..."); return undefined;
	}
}

function get_move_data (_identifier)
{
	switch _identifier
	{
		case Move.Fireball: return global.fireball;
		default: show_debug_message("Move not accounted for..."); return undefined;
	}
}