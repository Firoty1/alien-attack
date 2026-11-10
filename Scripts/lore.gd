extends Control

func _process(delta: float) -> void:
	$RichTextLabel.visible_ratio += .001
	if $RichTextLabel.visible_ratio == 1:
		$Button.visible = true


func _on_ok_pressed() -> void:
	$Label.visible = true
	$ok.visible = false


func _on_button_pressed():
	Manager.SceneChange("Game")
