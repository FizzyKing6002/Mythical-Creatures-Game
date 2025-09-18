enum PacketType // max length 256
{
	PlayerSyncRequest,
	PlayerSyncAccept,
	CombatSyncRequest,
	CombatSyncAccept,
	
	PlayerReadyRequest,
	PlayerReadyAccept,
	PlayerJoinTeamRequest,
	PlayerJoinTeamAccept,
	
	PartySelectStartEvent,
	PartySelectTimeoutEvent,
	PlayerPartySelectNextRequest,
	PlayerPartySelectNextAccept,
	PlayerPartySelectCreatureRequest,
	PlayerPartySelectCreatureAccept,
	
	CombatStartEvent,
	
	None,
}

enum LocalHost
{
	Server,
	Client,
	
	None,
}

enum Team // max length 256
{
	Blue,
	Red,
	
	None,
}

enum PartySelectStage // max length 256
{
	Blue1,
	Red1,
	Red2,
	Blue2,
	Blue3,
	Red3,
	Blue4,
	Red4,
	Preparation,
	
	None,
}

enum CombatCreature // max length 256
{
	Blue1,
	Blue2,
	Blue3,
	Blue4,
	Red1,
	Red2,
	Red3,
	Red4,
	
	None,
}

enum Map // max length 256
{
	Default,
	
	None,
}

enum Creature // max length 256
{
	Salamander,
	Griffin,
	Sphinx,
	Ent,
	Gorgon,
	Elf,
	Dwarf,
	Vampire,
	
	None,
}

enum Move // max length 256
{
	Fireball,
	
	None,
}

enum Event // max length 256
{
	CreatureTurn,
	CreateMove,
	DestroyMove,
	MoveMove,
	
	None,
}

enum DeployMethod
{
	Point,
	PointDirect,
	PointRDirect,
	Centre,
	CentreDirect,
	CentreRDirect,
	RArea,
	RAreaDirect,
	RAreaRDirect,
	
	None,
}

enum MoveShape
{
	Circle,
	Square,
	Sector,
	Line,
	
	None,
}

enum AreaGradient
{
	Distance,
	Direction,
	
	None,
}

enum StatusCondition
{
	Stunned,
	Poisoned,
	Slowed,
	Knockback,
	
	None,
}

enum PassiveAbility // max length 256
{
	None,
}

enum ActiveAbility // max length 256
{
	None,
}