extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var sensitivity: float = 0.004

var rotation_y := 0.0

@onready var camera = $Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	var camera_rotation = camera.rotation.y

	var direction = Vector3.ZERO
	direction.x = input_dir.x * cos(camera_rotation) + input_dir.y * sin(camera_rotation)
	direction.z = input_dir.x * sin(camera_rotation) - input_dir.y * cos(camera_rotation)

	direction = direction.normalized()

	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

	move_and_slide()

	var mouse_delta = Input.get_last_mouse_velocity()
	rotation_y -= mouse_delta.x * sensitivity
	rotation.y = deg_to_rad(rotation_y)

	camera.rotation.x = deg_to_rad(10)
