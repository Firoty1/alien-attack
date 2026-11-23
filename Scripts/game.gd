extends Node2D

var GhostChance = 0
var AsteroidChance = 90
var RocketChance = 10
var Spawns = 1
const ASTEROID = preload("uid://bu6ktknp000c5")
const ROCKET = preload("uid://balbrxnhhh2xb")
@onready var Player = $Player


func _on_spawn_timer_timeout():
	var SpawnRNG = RandomNumberGenerator.new()
	var Spawn = ["Asteroid", "Rocket", "Ghost"]
	var SpawnChances = [AsteroidChance,RocketChance, GhostChance]
	for i in Spawns:
		var ChosenSpawn = Spawn[SpawnRNG.rand_weighted(SpawnChances)]
		if ChosenSpawn == "Asteroid":
			SpawnAsteroid()
		elif ChosenSpawn == "Rocket":
			SpawnRocket()
		elif ChosenSpawn == "Ghost":
			pass

func SpawnAsteroid():
	$SpawningArea/SpawnPosition.progress_ratio = randf_range(0,1)
	var AsteroidPosition = $SpawningArea/SpawnPosition.position
	var AsteroidDirection = AsteroidPosition.angle_to_point($Player.position) + randf_range(-PI/7,PI/7)
	var Asteroid = ASTEROID.instantiate()
	self.add_child(Asteroid)
	Asteroid.position = AsteroidPosition
	Asteroid.rotation = AsteroidDirection

func SpawnRocket():
	$SpawningArea/SpawnPosition.progress_ratio = randf_range(0,1)
	var AsteroidPosition = $SpawningArea/SpawnPosition.position
	var AsteroidDirection = AsteroidPosition.angle_to_point($Player.position) + randf_range(-PI/3,PI/3)
	var Asteroid = ROCKET.instantiate()
	self.add_child(Asteroid)
	Asteroid.position = AsteroidPosition
	Asteroid.rotation = AsteroidDirection


func WaveEnd():
	Manager.SceneChange("Skill")
