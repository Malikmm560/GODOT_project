extends Area3D

static var door = 0

@onready var l: Label3D = $Sprite3D/Label3D
@onready var ani: AnimationPlayer = $AnimationPlayer

var rooms = ["res://$cene/long_room.tscn","res://$cene/long2_room.tscn","res://$cene/squareroom.tscn"]

var on = false

var debounce= false

func _ready() -> void:
	door +=1
	l.text = str(door)

func _process(_delta: float) -> void:
	if on and Input.is_action_just_pressed("E"):
		if door == 52:
			get_tree().change_scene_to_file("res://$cene/shop_room.tscn")
		elif !debounce:
			ani.play("open")
			debounce = true
		else:
			var rand = rooms[randi()%rooms.size()]
			get_tree().change_scene_to_file(rand)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("plr"):
		on = true

func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("plr"):
		on = false
