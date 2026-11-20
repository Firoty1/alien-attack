extends Line2D

func ready():
	var Origin = get_meta("OriginSkill")
	var Locked = get_meta("LockedSkill")
	Origin.Unlocked.connect(Locked.CheckUnlock)
