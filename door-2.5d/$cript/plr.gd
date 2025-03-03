extends CharacterBody3D

@onready var ani = $AnimationPlayer

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var flashlight: SpotLight3D = null
var flash_rotat_smooth := 15.0
var flash_posistion_smooth := 15.0
@onready var camera = $Camera3D

#var flashlight: Node3D = null

func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#flashlight = get_node("/root/room/Flashlight")
	#flashlight = get_node("/root/room/flashlight")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass
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

	# Flashlight position logic (added here)
	if direction:
		var target_offset = Vector3.ZERO
		if direction.x < -0.1:
			target_offset = Vector3(-0.3, 0, 0) # Move flashlight to the left
		elif direction.x > 0.1:
			target_offset = Vector3(0.3, 0, 0) # Move flashlight to the right
		
		# Smoothly move flashlight towards the target offset
		#flashlight.position.x = lerp(flashlight.position.x, target_offset.x, delta * flash_posistion_smooth)
	else:
		# Go back to center when not moving
		#flashlight.position.x = lerp(flashlight.position.x, 0, delta * flash_posistion_smooth)
		pass
