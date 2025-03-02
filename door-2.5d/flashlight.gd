extends Node3D

@onready var flashlight_sprite = $Sprite3D  # Path to the flashlight sprite in the hand
@onready var flashlight_light = $SpotLight3D  # Path to the spotlight (flashlight light)
@onready var cursor = $"../../Cursor"  # Path to the cursor Node2D (2D cursor in the screen)
@onready var player = $"../.."  # Path to the player (root of the player)

var camera = null

# Called when the scene is ready
func _ready():
	camera = get_viewport().get_camera_3d()  # Get the camera of the current viewport
	if camera == null:
		print("Error: No camera found!")  # Debugging message to check if camera is null

# Called every frame, used to update the flashlight and spotlight
func _process(delta):
	if camera == null:
		return  # Exit early if there's no camera (safety check)

	# Get the mouse position in 2D screen coordinates
	var mouse_pos = get_viewport().get_mouse_position()

	# Move the cursor in 2D on the screen
	cursor.global_position = mouse_pos

	# Convert the mouse position to world space using the camera
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_direction = camera.project_ray_normal(mouse_pos)

	# Calculate the intersection point (where the mouse ray intersects the ground or 3D world)
	var intersection_point = ray_origin + ray_direction * (flashlight_light.global_position.y - ray_origin.y) / ray_direction.y

	# Move the spotlight to the intersection point (mouse position in world space)
	flashlight_light.global_position = intersection_point

	# Calculate the direction from the flashlight sprite to the spotlight
	var direction = flashlight_light.global_position - flashlight_sprite.global_position

	# Ignore the Y-axis for horizontal rotation (left-right rotation)
	direction.y = 0  

	# Calculate the horizontal (Y-axis) angle (left-right rotation)
	var angle_y = direction.angle_to(Vector3.FORWARD)  # Horizontal angle
	
	# For vertical rotation (X-axis), calculate the angle based on the direction
	var angle_x = -direction.normalized().y  # Vertical angle (up-down)

	# Smooth rotation to make the flashlight follow the cursor direction smoothly
	flashlight_sprite.rotation_degrees.y = lerp_angle(flashlight_sprite.rotation_degrees.y, angle_y, 5 * delta)  # Horizontal rotation (Y-axis)
	flashlight_sprite.rotation_degrees.x = lerp_angle(flashlight_sprite.rotation_degrees.x, angle_x, 5 * delta)  # Vertical rotation (X-axis)
