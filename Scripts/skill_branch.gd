extends Line2D

@export var Origin: Node
@export var Locked: Node

func _ready():
	Origin.SkillUnlocked.connect(Locked.CheckUnlock)
