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
signal SkillUnlocked

func _ready():
	await get_tree().create_timer(.03).timeout
	if SkillName == "AttackSpeed":
		Stat = 1/Stat
	tooltip_text = Tooltip1 + str(Level) + "/" + str(MaxLevel) + ": " + str(Stat) + Tooltip2

func CheckUnlock():
	print("a")
	var Unlock = true
	for i in Requirements:
		i = get_node(i)
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
		await get_tree().create_timer(.05).timeout
		if Level == 1:
			SkillUnlocked.emit()


func AddLevel():
	Level += 1
	Unlocked = true
	Stat = SkillManager.GetStat(SkillName) if SkillName != "AttackSpeed" else 1/SkillManager.GetStat(SkillName)
	tooltip_text = Tooltip1 + str(Level) + "/" + str(MaxLevel) + ": " + str(Stat) + Tooltip2
