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
	var intersection_point = ray_origin + ray_direction * (flashlight_light.global_position.y - ray_origin.y) / ray_direction.y

	flashlight_light.look_at(intersection_point, Vector3.UP)
	flashlight_sprite.look_at(intersection_point, Vector3.UP)
