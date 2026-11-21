extends Button

@export var Requirements: Array
@export var SkillType: String
@export var SkillName: String
var Level = 1
@export var MaxLevel: int
@export var Tooltip1: String
var Stat

func _ready():
	tooltip_text = Tooltip1 + str(Level) + "/" + str(MaxLevel) + ": " + Stat

func CheckUnlock():
	var Unlock = true
	for i in Requirements:
		if !i.Unlocked:
			Unlock = false
	if Unlock:
		UnlockNode()

func UnlockNode():
	disabled = false


func _on_pressed():
	if get_parent().get_parent().SkillPoints != 0 and Level != MaxLevel:
		get_parent().get_parent().SkillPoints -= 1
		AddLevel()
		print("a")
		if SkillType == "Stat":
			SkillManager.StatUpgrade(SkillName)
		else:
			SkillManager.AbilityUnlock(SkillName)

func AddLevel():
	pass 
	#tooltip_text = 
