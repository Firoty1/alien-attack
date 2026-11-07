extends Area2D

@export var MinSpeed: int
@export var MaxSpeed: int
var Speed

func _ready():
	Speed = randi_range(MinSpeed,MaxSpeed)

func _physics_process(delta):
	var Direction = Vector2(1,0).rotated(rotation)
	position += Speed * Direction * delta
