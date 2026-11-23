extends Control

var SkillPoints = 1

func _ready():
	for i in $Nodes.get_children():
		i.Stat = SkillManager.GetStat(i.SkillName)
		i.Pressed.connect(SkillUnlocked)
	for i in SkillManager.Upgrades:
		for I in $Nodes.get_children():
			if I.SkillName == i:
				I.Unlocked = true
				I.SkillUnlocked.emit()
				I.Level += 1



func SkillUnlocked():
	SkillPoints -= 1
	$Points.text = "Skill Points Remaining: " + str(SkillPoints)


func _on_button_pressed():
	print(SkillManager.Upgrades)
	Manager.SceneChange("Game")
