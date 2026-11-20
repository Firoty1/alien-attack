extends Node


func StatUpgrade(Stat):
	if Stat == "Speed":
		Manager.max_speed += 25
