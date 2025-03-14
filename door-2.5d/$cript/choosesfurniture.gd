extends Marker3D

var furniture = ["res://$cene/basicdrawer.tscn","res://$cene/largemultydrawer.tscn","res://$cene/longbasicdrawer.tscn","res://$cene/multydrawer.tscn"]

func _ready() -> void:
	var rand = furniture[randi()%furniture.size()] #chooooooooses a random drawer/furniture
	
	if randi_range(0,1)==1:
		var obj = load(rand).instantiate()
		call_deferred("add_sibling",obj)
		obj.global_position = global_position
		obj.scale = scale
		obj.rotation = rotation
		
		queue_free()
