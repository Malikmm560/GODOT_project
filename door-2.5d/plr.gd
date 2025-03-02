extends CharacterBody3D

@onready var ani = $AnimationPlayer

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var flashlight: SpotLight3D = $SpotLight3D
var flash_rotat_smooth := 15.0
var flash_posistion_smooth := 15.0
@onready var camera = $Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		print(direction)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if direction:
		ani.play("alking")
		if direction <= Vector3(-0.1,0,0):
			$Sprite3D.flip_h = true
		elif direction >= Vector3(0.1,0,0):
			$Sprite3D.flip_h = false
	else:
		ani.play("idle")
	
	move_and_slide()
