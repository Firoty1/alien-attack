extends CharacterBody2D

@export var acceleration: float
@export var max_speed: float
@export var rotation_speed: float
@export var TurnOrDirectionalMovement: String

func TurnMovement(delta):
	var input_vector := Vector2(0, Input.get_axis("forward","reverse"))

	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)
		
	velocity += input_vector.rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	
	if Input.is_action_pressed("left"):
		rotate(deg_to_rad(-rotation_speed * delta))
	if Input.is_action_pressed("right"):
		rotate(deg_to_rad(rotation_speed * delta))

func DirectionalMovement(delta):
	pass

func _physics_process(delta):
	if TurnOrDirectionalMovement == "Turn":
		TurnMovement(delta)
	move_and_slide()
