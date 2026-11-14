extends Control

func _ready():
	$Button.visible = true
	if Manager.first:
		$Button.text = "CAN I START NOW?"
	else:
		$Button.text = "Ok... lets try again."

func _process(delta: float) -> void:
	$RichTextLabel.visible_ratio += .002
	if $RichTextLabel.visible_ratio == 1:
		$Button.visible = true
		$Label.visible = false
		Manager.first = false
		$Button.text = "Launch Spaceship"

func _on_button_pressed() -> void:
	if Manager.first:
		$Button.visible = false
		$Label.visible = true
	else:
		Manager.SceneChange("Game")
