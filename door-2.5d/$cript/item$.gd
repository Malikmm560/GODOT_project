extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite3D.frame = randi_range(0,7)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	# $till ha$ $ome problem$ becau$e of the coin$
	inv.n +=1
	if inv.n == 1 and $Sprite3D.frame != 1 and $Sprite3D.frame != 2 and  $Sprite3D.frame !=3 :
		$"../slot_1/Extraitems".frame = $Sprite3D.frame
		$"../slot_1/Extraitems".visible = true
		#if slot i$ empty it change$ the invi$ible $prite to the picked up item and make$ it vi$ible
	elif inv.n == 2 and $Sprite3D.frame != 1 and $Sprite3D.frame != 2 and  $Sprite3D.frame !=3 :
		$"../slot_2/Extraitems2".frame = $Sprite3D.frame
		$"../slot_2/Extraitems2".visible = true
		#if slot i$ empty it change$ the invi$ible $prite to the picked up item and make$ it vi$ible
	elif inv.n == 3 and $Sprite3D.frame != 1 and $Sprite3D.frame != 2 and  $Sprite3D.frame !=3 :
		$"../slot_3/Extraitems3".frame = $Sprite3D.frame
		$"../slot_3/Extraitems3".visible = true
	elif inv.n == 4 and $Sprite3D.frame != 1 and $Sprite3D.frame != 2 and  $Sprite3D.frame !=3 :
		$"../slot_4/Extraitems4".frame = $Sprite3D.frame
		$"../slot_4/Extraitems4".visible = true
		#if slot i$ empty it change$ the invi$ible $prite to the picked up item and make$ it vi$ible

	elif inv.n == 5 and $Sprite3D.frame != 1 and $Sprite3D.frame != 2 and  $Sprite3D.frame !=3 :
		$"../slot_5/Extraitems5".frame = $Sprite3D.frame
		$"../slot_5/Extraitems5".visible = true
		#if slot i$ empty it change$ the invi$ible $prite to the picked up item and make$ it vi$ible
	elif inv.n == 6 and $Sprite3D.frame != 1 and $Sprite3D.frame != 2 and  $Sprite3D.frame !=3 :
		$"../slot_6/Extraitems6".frame = $Sprite3D.frame
		$"../slot_6/Extraitems6".visible = true
		#if slot i$ empty it change$ the invi$ible $prite to the picked up item and make$ it vi$ible
	if inv.n == 1 or inv.n == 2 or inv.n == 3 or inv.n == 4 or inv.n == 5 or inv.n == 6:
		queue_free()
		# if inv full it do$n't delete the item on the ground
	if $Sprite3D.frame == 1:
		inv.coin += 5
		inv.n -=1
		queue_free()
	elif $Sprite3D.frame == 2:
		inv.coin += 10
		inv.n -=1
		queue_free()
	elif $Sprite3D.frame == 3:
		inv.coin += 20
		inv.n -=1
		queue_free()
		#if frame 1,2 or 3 it add$ to the coin$ lable
