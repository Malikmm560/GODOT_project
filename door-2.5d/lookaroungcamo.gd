extends Camera3D

@export var sensitivity: float = 0.002

@onready var ray_cast_3d: RayCast3D = $RayCast3D  # Get the RayCast3D node

var rotation_x: float = 0.0

var wanaExit = false

@onready var sp: Sprite3D = $"../exitbuttons/Sprite3D"
@onready var sp2: Sprite3D = $"../exitbuttons/Sprite3D2"
@onready var playani: AnimationPlayer = $"../Playbutton/playani"

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED  # Lock cursor to screen

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and wanaExit:
		get_tree().quit()
	
	if event is InputEventMouseMotion:
		# Rotate the camera horizontally
		rotate_y(-event.relative.x * sensitivity)

		# Rotate the camera vertically
		rotation_x -= event.relative.y * sensitivity
		rotation_x = clamp(rotation_x, deg_to_rad(-89), deg_to_rad(89))

		rotation.x = rotation_x

func _process(_delta):
	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		if collider.name == "exitbuttons":
			wanaExit = true
			sp.frame = 1
			sp2.frame = 1
		elif collider.name == "Playbutton":
			playani.play("open")
	else:
		wanaExit = false
		sp.frame = 0
		sp2.frame = 0
