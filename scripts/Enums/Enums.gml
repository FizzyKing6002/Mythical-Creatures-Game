enum PacketType // max length 256
{
	PlayerSyncRequest,
	PlayerSyncAccept,
	PlayerReadyRequest,
	PlayerReadyAccept,
	PlayerJoinTeamRequest,
	PlayerJoinTeamAccept,
	CombatStartEvent,
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
	None,
}

enum Move // max length 256
{
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