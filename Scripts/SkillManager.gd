extends Node

var Speed = 450
var bulletspeed = 1000
var BulletPierce = 0
#How long between each shot in seconds
var attackspeed = .5
var Bullets = 2
var Lives = 1
var PointsMult = 1

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

func AbilityUnlock(Ability):
	pass

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
