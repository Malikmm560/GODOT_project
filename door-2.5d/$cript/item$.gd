extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite3D.frame = randi_range(0,7)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	queue_free()
