extends Node2D

var GhostChance = 0
var AsteroidChance = 100
var Spawns = 1
const ASTEROID = preload("uid://bu6ktknp000c5")



func _on_spawn_timer_timeout():
	var SpawnRNG = RandomNumberGenerator.new()
	var Spawn = ["Asteroid", "Ghost"]
	var SpawnChances = [AsteroidChance, GhostChance]
	for i in Spawns:
		var ChosenSpawn = Spawn[SpawnRNG.rand_weighted(SpawnChances)]
		if ChosenSpawn == "Asteroid":
			SpawnAsteroid()
		elif ChosenSpawn == "Ghost":
			pass

func SpawnAsteroid():
	$SpawningArea/SpawnPosition.progress_ratio = randf_range(0,1)
	var AsteroidPosition = $SpawningArea/SpawnPosition.position
	var AsteroidDirection = AsteroidPosition.angle_to_point($Player.position) + randf_range(-PI/5,PI/5)
	var Asteroid = ASTEROID.instantiate()
	self.add_child(Asteroid)
	Asteroid.position = AsteroidPosition
	Asteroid.rotation = AsteroidDirection
