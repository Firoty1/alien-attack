extends Area2D

var Speed: int
var direction
var Shot = false
var Pierces = 0

func Shoot():
	Shot = true
	rotation = direction.angle()

func _physics_process(delta):
	if Shot:
		var velocity = direction * Speed * delta
		position += velocity


func Hit(ThingHit):
	if Pierces == 0:
		print("boom")
		queue_free()
	else:
		print("P")
		Pierces -= 1


func _on_body_entered(body):
	await get_tree().create_timer(1).timeout
	queue_free()
	print("out")
