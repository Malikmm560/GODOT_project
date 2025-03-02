extends Node3D

@export var speed: float = 5.0
@onready var flashlight_sprite = $Sprite3D

func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		flashlight_sprite.scale.x = -1  
	
	
	elif Input.is_action_pressed("ui_right"):
		flashlight_sprite.scale.x = 1  
