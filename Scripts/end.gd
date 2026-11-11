extends Control

func _ready():
	$Label2.text = "Points: " + str(Manager.Points)
	


func _on_button_pressed():
	Manager.first = false
	Manager.Points = 0
	Manager.SceneChange("Menu")
