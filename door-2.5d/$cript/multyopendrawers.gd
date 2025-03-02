extends StaticBody3D

@onready var ani: AnimationPlayer = $AnimationPlayer

var plrishere = false
var open1 = false
var open2 = false
var open3 = false

var allopen = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("E") and plrishere:
		if !allopen:
			if !open3:
				ani.play("open3")
				open3= true
			elif !open2:
				ani.play("open2")
				open2= true
			elif !open1:
				ani.play("open1")
				open1= true
			else:
				allopen = true
		if allopen:
			if open3:
				ani.play_backwards("open3")
				open3= false
			elif open2:
				ani.play_backwards("open2")
				open2= false
			elif open1:
				ani.play_backwards("open1")
				open1= false
			else:
				allopen = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("plr"): #the plr is not in group plr yet and idk if i can change anything
		plrishere = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("plr"):
		plrishere = false
