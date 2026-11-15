extends CharacterBody2D

@export var acceleration: float
@export var max_speed: float
@export var rotation_speed: float
#Make TurnOrDirectionalMovement Turn for turn movement and Directional for directional movement
@export var TurnOrDirectionalMovement: String
var Lives = 3
var Invincible = false
const BULLET = preload("uid://b5wsdkyge037e")
var canshoot = true

#Turn left/right and move forward/backward

#wasd movement
func DirectionalMovement(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * max_speed * delta * 75
	
	rotation = direction.angle() + PI/2 if direction != Vector2.ZERO else rotation
	
	if velocity == Vector2.ZERO:
		$Sprite2D.animation = "Still"
	else:
		$Sprite2D.animation = "Moving"

func _physics_process(delta):
	DirectionalMovement(delta)
	if Input.is_action_pressed("shoot") and canshoot:
		ShootBullets()
		canshoot = false
		await get_tree().create_timer(Manager.attackspeed).timeout
		canshoot = true
	move_and_slide()

func ShootBullets(direction = position.direction_to(get_global_mouse_position())):
	var bullets = BULLET.instantiate()
	get_parent().add_child(bullets)
	bullets.Speed =  Manager.bulletspeed
	bullets.position = position
	bullets.direction = direction
	bullets.Pierces = Manager.BulletPierce
	bullets.Shoot()

func HitObstacle(_area):
	Lives -= 1
	if Lives == 0:
		Manager.SceneChange("End")
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
