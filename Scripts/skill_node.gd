extends Button

@export var Requirements: Array
var Unlocked = false
@export var SkillType: String
@export var SkillName: String
var Level = 0
@export var MaxLevel: int
@export var Tooltip1: String
@export var Tooltip2: String
var Stat
signal Pressed

func _ready():
	await get_tree().create_timer(.03).timeout
	if SkillName == "AttackSpeed":
		Stat = 1/Stat
	tooltip_text = Tooltip1 + str(Level) + "/" + str(MaxLevel) + ": " + str(Stat) + Tooltip2

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
		Pressed.emit()
		if SkillType == "Stat":
			SkillManager.StatUpgrade(SkillName)
		else:
			SkillManager.AbilityUnlock(SkillName)
		AddLevel()


func AddLevel():
	Level += 1
	Unlocked = true
	Stat = SkillManager.GetStat(SkillName) if SkillName != "AttackSpeed" else 1/SkillManager.GetStat(SkillName)
	tooltip_text = Tooltip1 + str(Level) + "/" + str(MaxLevel) + ": " + str(Stat) + Tooltip2
