extends CharacterBody2D

@export var acceleration: float
@export var max_speed: float
@export var rotation_speed: float
#Make TurnOrDirectionalMovement Turn for turn movement and Directional for directional movement
@export var TurnOrDirectionalMovement: String
var Lives = 3
var Invincible = false


#Turn left/right and move forward/backward
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

#wasd movement
func DirectionalMovement(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * max_speed * delta * 75
	


func _physics_process(delta):
	#This lets us decide which movement type we want by testing both of them
	if TurnOrDirectionalMovement == "Turn":
		TurnMovement(delta)
	elif TurnOrDirectionalMovement == "Directional":
		DirectionalMovement(delta)
	
	move_and_slide()


func HitObstacle(area):
	Lives -= 1
	$BlinkTimer.start()
	$InvincibilityTimer.start()
	Invincible = true
	print(Lives)


func _on_invincibility_timer_timeout():
	$Area2D/CollisionShape2D.disabled = false
	Invincible = false


func _on_blink_timer_timeout():
	$BlinkTimer.start()
	if modulate.a8 == 255:
		modulate.a8 = 100
	else: 
		modulate.a8 = 255
	if !Invincible:
		modulate.a8 = 255
		$BlinkTimer.stop()
