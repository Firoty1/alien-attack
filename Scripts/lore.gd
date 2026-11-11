extends Control

func _ready():
	if !Manager.first:
		$Button.visible = true

func _process(delta: float) -> void:
	$RichTextLabel.visible_ratio += .002
	if $RichTextLabel.visible_ratio == 1:
		$Button.visible = true


func _on_ok_pressed() -> void:
	$Label.visible = true
	$ok.visible = false


func _on_button_pressed():
	Manager.SceneChange("Game")
