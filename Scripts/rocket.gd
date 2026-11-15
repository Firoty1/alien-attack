extends Area2D

var Speed
@export var MinSpeed: int
@export var MaxSpeed: int
var spawned = false
var OffScreen = false

func _ready():
	Speed = randi_range(MinSpeed,MaxSpeed)

func _physics_process(delta):
	if !OffScreen:
		var Direction = Vector2(1,0).rotated(rotation)
		position += Speed * Direction * delta
		rotation = rotate_toward(rotation, position.angle_to_point(get_parent().Player.position) ,PI/180)


func _on_body_entered(_body):
	if spawned:
		await get_tree().create_timer(.2).timeout
		OffScreen = true
		await get_tree().create_timer(.7).timeout
		queue_free()
	else:
		spawned = true


func _on_area_entered(_area):
	split()

func split():
	#change if we have time
	Manager.Points += 10
	queue_free()
