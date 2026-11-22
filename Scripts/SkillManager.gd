extends Node

var Speed = 450
var bulletspeed = 1000
var BulletPierce = 0
#How long between each shot in seconds
var attackspeed = .5
var Bullets = 2
var Lives = 3
var PointsMult = 1
var Explosion = false
var ExplosionBullets = 0
var Dash = false
var DashCooldown = 10
var Homing = "None"

func StatUpgrade(Stat):
	if Stat == "Speed":
		Speed += 50
	elif Stat == "BulletPierces":
		BulletPierce += 1
	elif Stat == "AttackSpeed":
		attackspeed -= .05
	elif Stat == "BulletSpeed":
		bulletspeed += 100
	elif Stat == "Bullets":
		Bullets += 1
	elif Stat == "Life":
		Lives += 1
	elif Stat == "PointsMult":
		PointsMult += .5
	elif Stat == "Homing":
		var Levels = ["None", "Weak", "Moderate", "Strong"]
		var NewLevel = Levels.find(Homing) + 1
		Homing = Levels.get(NewLevel)

func AbilityUnlock(Ability):
	if Ability == "Explosion":
		if Explosion:
			ExplosionBullets += 4
		else:
			Explosion = true
			ExplosionBullets = 8
	elif Ability == "Dash":
		if Dash:
			DashCooldown -= 1
		else:
			Dash = true

func GetStat(Stat):
	if Stat == "Speed":
		return Speed
	elif Stat == "BulletPierces":
		return BulletPierce 
	elif Stat == "AttackSpeed":
		return attackspeed 
	elif Stat == "BulletSpeed":
		return bulletspeed 
	elif Stat == "Bullets":
		return Bullets 
	elif Stat == "Life":
		return Lives 
	elif Stat == "PointsMult":
		return PointsMult
	elif Stat == "Explosion":
		return ExplosionBullets
	elif Stat == "Dash":
		return DashCooldown
	elif Stat == "Homing":
		return Homing
