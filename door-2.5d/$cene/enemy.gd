extends Node3D

var enemy_scene = preload("res://$cene/enemy.tscn")

func _ready() -> void:
	var _random = randf_range(0, 20)
	spawn_enemy(_random)
	print("Spawned enemy at random position:", _random)

func spawn_enemy(random_x):
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	
	# Assuming it's a 3D enemy and has a position:
	enemy.global_transform.origin = Vector3(random_x, 0, 0)  # Random X position
