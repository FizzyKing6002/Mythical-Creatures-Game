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