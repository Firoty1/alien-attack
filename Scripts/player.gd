extends CharacterBody2D

@export var acceleration: float
var max_speed
@export var rotation_speed: float
#Make TurnOrDirectionalMovement Turn for turn movement and Directional for directional movement
@export var TurnOrDirectionalMovement: String
var Lives = 3
var Invincible = false
const BULLET = preload("uid://b5wsdkyge037e")
var canshoot = true
var canExplode

func _ready():
	max_speed = SkillManager.Speed
	Lives = SkillManager.Lives
	canExplode = SkillManager.Explosion

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
		ShootBullets(1, SkillManager.Bullets)
		canshoot = false
		await get_tree().create_timer(SkillManager.attackspeed).timeout
		canshoot = true
	if Input.is_action_pressed("Explosion") and canExplode:
		Explosion()
		canExplode = false
		await get_tree().create_timer(10).timeout
		canExplode = true
	move_and_slide()

func Explosion():
	print("a")
	for i in SkillManager.ExplosionBullets:
		var direction = Vector2.from_angle(2*PI/SkillManager.ExplosionBullets * i)
		ShootBullets(2, 1, direction)

#Type of 1 means bullets from guns, Type of 2 means bullets from center
func ShootBullets(Type,Amount,direction = position.direction_to(get_global_mouse_position())):
	if Type == 1:
		var SpawnPositions = [$Gun1.global_position, $Gun2.global_position]
		for i in Amount:
			var SpawnPosition = $Gun1.global_position if fmod(i, 2) == 0 else $Gun2.global_position
			var bullets = BULLET.instantiate()
			get_parent().add_child(bullets)
			bullets.Speed =  SkillManager.bulletspeed
			bullets.position = SpawnPosition
			bullets.direction = direction
			bullets.Pierces = SkillManager.BulletPierce
			bullets.Shoot()
	else:
		for i in Amount:
			var bullets = BULLET.instantiate()
			get_parent().add_child(bullets)
			bullets.Speed =  SkillManager.bulletspeed
			bullets.position = position
			bullets.direction = direction
			bullets.Pierces = SkillManager.BulletPierce
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
