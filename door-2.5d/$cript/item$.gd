extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite3D.frame = randi_range(0,7)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	inv.n +=1
	if inv.n == 1:
		$"../slot_1/Extraitems".frame = $Sprite3D.frame
		$"../slot_1/Extraitems".visible = true
		if $Sprite3D.frame == 1:
			$"../slot_1/Extraitems".visible = false
			inv.coin += 5
			inv.n -=1
		elif $Sprite3D.frame == 2:
			$"../slot_1/Extraitems".visible = false
			inv.coin += 10
			inv.n -=1
		elif $Sprite3D.frame == 3:
			$"../slot_1/Extraitems".visible = false
			inv.coin += 20
			inv.n -=1
	elif inv.n == 2:
		$"../slot_2/Extraitems2".frame = $Sprite3D.frame
		$"../slot_2/Extraitems2".visible = true
		if $Sprite3D.frame == 1:
			$"../slot_2/Extraitems2".visible = false
			inv.coin += 5
			inv.n -=1
		elif $Sprite3D.frame == 2:
			$"../slot_2/Extraitems2".visible = false
			inv.coin += 10
			inv.n -=1
		elif $Sprite3D.frame == 3:
			$"../slot_2/Extraitems2".visible = false
			inv.coin += 20
			inv.n -=1
	elif inv.n == 3:
		$"../slot_3/Extraitems3".frame = $Sprite3D.frame
		$"../slot_3/Extraitems3".visible = true
		if $Sprite3D.frame == 1:
			$"../slot_3/Extraitems3".visible = false
			inv.coin += 5
			inv.n -=1
		elif $Sprite3D.frame == 2:
			$"../slot_3/Extraitems3".visible = false
			inv.coin += 10
			inv.n -=1
		elif $Sprite3D.frame == 3:
			$"../slot_3/Extraitems3".visible = false
			inv.coin += 20
			inv.n -=1
	elif inv.n == 4:
		$"../slot_4/Extraitems4".frame = $Sprite3D.frame
		$"../slot_4/Extraitems4".visible = true
		if $Sprite3D.frame == 1:
			$"../slot_4/Extraitems4".visible = false
			inv.coin += 5
			inv.n -=1
		elif $Sprite3D.frame == 2:
			$"../slot_4/Extraitems4".visible = false
			inv.coin += 10
			inv.n -=1
		elif $Sprite3D.frame == 3:
			$"../slot_4/Extraitems4".visible = false
			inv.coin += 20
			inv.n -=1
	elif inv.n == 5:
		$"../slot_5/Extraitems5".frame = $Sprite3D.frame
		$"../slot_5/Extraitems5".visible = true
		if $Sprite3D.frame == 1:
			$"../slot_5/Extraitems5".visible = false
			inv.coin += 5
			inv.n -=1
		elif $Sprite3D.frame == 2:
			$"../slot_5/Extraitems5".visible = false
			inv.coin += 10
			inv.n -=1
		elif $Sprite3D.frame == 3:
			$"../slot_5/Extraitems5".visible = false
			inv.coin += 20
			inv.n -=1
	elif inv.n == 6:
		$"../slot_6/Extraitems6".frame = $Sprite3D.frame
		$"../slot_6/Extraitems6".visible = true
		if $Sprite3D.frame == 1:
			$"../slot_6/Extraitems6".visible = false
			inv.coin += 5
			inv.n -=1
		elif $Sprite3D.frame == 2:
			$"../slot_6/Extraitems6".visible = false
			inv.coin += 10
			inv.n -=1
		elif $Sprite3D.frame == 3:
			$"../slot_6/Extraitems6".visible = false
			inv.coin += 20
			inv.n -=1
	if inv.n == 1 or inv.n == 2 or inv.n == 3 or inv.n == 4 or inv.n == 5 or inv.n == 6:
		queue_free()
