extends Line2D

@export var OriginSkill: NodePath
@export var LockedSkill: NodePath

func ready():
	OriginSkill.Unlocked.connect(LockedSkill.CheckUnlock)
