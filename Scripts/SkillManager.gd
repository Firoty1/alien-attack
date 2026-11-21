extends Node

var Speed = 450
var bulletspeed = 1000
var BulletPierce = 0
#How long between each shot in seconds
var attackspeed = .5
var Bullets = 2
var Lives = 1

func StatUpgrade(Stat):
	if Stat == "Speed":
		Speed += 25
	elif Stat == "BulletPierce":
		BulletPierce += 1
	elif Stat == "AttackSpeed":
		attackspeed -= .05
	elif Stat == "BulletSpeed":
		bulletspeed += 100
	elif Stat == "Bullets":
		Bullets += 1
	elif Stat == "Life":
		Lives += 1
