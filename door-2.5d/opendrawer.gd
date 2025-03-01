extends StaticBody3D

@onready var ani: AnimationPlayer = $AnimationPlayer

var plrishere = false
var open1 = false

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("E") and plrishere:
		if !open1:
			ani.play("open1")
			open1= true
		else:
			open1 = false
			ani.play_backwards("open1")

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("plr"): #the plr is not in group plr yet and idk if i can change anything
		plrishere = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("plr"):
		plrishere = false
