extends Area2D

@export var MinSpeed: int
@export var MaxSpeed: int
var Speed
var spawned = false
func _ready():
	Speed = randi_range(MinSpeed,MaxSpeed)

func _physics_process(delta):
	var Direction = Vector2(1,0).rotated(rotation)
	position += Speed * Direction * delta


func _on_body_entered(_body):
	if spawned:
		await get_tree().create_timer(1).timeout
		queue_free()
	else:
		spawned = true


func _on_area_entered(_area):
	split()

func split():
	#change if we have time
	Manager.Points += 10
	queue_free()
