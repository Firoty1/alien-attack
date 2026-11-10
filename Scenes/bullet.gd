extends Area2D

@export var speed: float
var direction

func _ready():
	rotation = direction.angle()
