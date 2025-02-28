extends Node
# this var starts at 1O0 you can change that 

const MAX_HEALTH = 100
var health = MAX_HEALTH

func _ready() -> void:
	
	$CanvasLayer/ProgressBar.max_value = MAX_HEALTH
	$CanvasLayer/Button.pressed.connect(restart_game_local)
	
	health_bar()

func _input(event: InputEvent) -> void:
	#here this is when the button pressed that get HIT
	#change it for enemys if it attacks 😭
	if event.is_action_pressed("ui_down"):
		
		# and uh this should keep it to notify if it get hit or just dont remove 
		damage_or_hit()

func health_bar() -> void:
	$CanvasLayer/ProgressBar.value = health

func damage_or_hit() -> void:
	#health it will remove 5 times if you dont like it change it NOT MORE THAN 50 😭😭
	health -= 5
	if health <= 0:
		$CanvasLayer/ColorRect.visible = true
		$CanvasLayer/Label2.text = "DEAD"
		$CanvasLayer/Label2.modulate = Color.RED
		$CanvasLayer/Button.visible = true
		$CanvasLayer/Button.text = "Restart"

	health_bar()

#and this is when player gets health < 0 automaticly react it then its triggers func health bar IF button get pressed
func restart_game_local() -> void:
	print("Restarting game...")
	health = MAX_HEALTH
	$CanvasLayer/Label2.text = ""
	$CanvasLayer/Label2.modulate = Color.WHITE
	$CanvasLayer/Button.visible = false
	$CanvasLayer/ColorRect.visible = false
	health_bar()
	$"../..".position = Vector3(0, 0, 0)  # Change this to the starting position
