extends Control

var SkillPoints = 7

func _ready():
	for i in $Nodes.get_children():
		i.Stat = SkillManager.GetStat(i.SkillName)
		i.Pressed.connect(SkillUnlocked)

func SkillUnlocked():
	SkillPoints -= 1
	$Points.text = "Skill Points Remaining: " + str(SkillPoints)
