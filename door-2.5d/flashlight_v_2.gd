extends Node3D

@onready var flashlight_sprite = $Sprite3D
@onready var flashlight_light = $SpotLight3D
@onready var player = $"../.."

var camera = null

func _ready():
	camera = get_viewport().get_camera_3d()
	if camera == null:
		print("Error: No camera found!")

func _process(delta):
	if camera == null:
		return

	var mouse_pos = get_viewport().get_mouse_position()
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_direction = camera.project_ray_normal(mouse_pos)
	var target_pos = ray_origin + ray_direction * 20.0  # Distance of projection

	# Make the spotlight aim at the target position
	flashlight_light.look_at(target_pos, Vector3.UP)

	# Make the flashlight itself rotate towards the target position
	flashlight_sprite.look_at(target_pos, Vector3.UP)
