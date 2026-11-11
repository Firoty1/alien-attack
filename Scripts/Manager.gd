extends Node

var Lv = 1
var Points = 0
var bulletspeed = 300
var BulletPierce = 1
var first = true

func SceneChange(Scene):
	if Scene == "Game":
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
	elif Scene == "Lore":
		get_tree().change_scene_to_file("res://Scenes/lore.tscn")
	elif Scene == "Menu":
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	elif Scene == "Skill":
		get_tree().change_scene_to_file("res://Scenes/skills.tscn")
	elif Scene == "End":
		get_tree().change_scene_to_file("res://Scenes/end.tscn")
