enum PacketType // max length 256
{
	PlayerSyncRequest,
	PlayerSyncAccept,
	PlayerReadyRequest,
	PlayerReadyAccept,
	GameStart,
}

enum LocalHost
{
	None,
	Server,
	Client,
}

enum Creature // max length 256
{
	None,
	Salamander,
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