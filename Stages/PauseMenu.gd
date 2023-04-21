extends CanvasLayer

var paused: bool = false

func _ready():
	$Continue.hide()

func _process(delta):
	if Input.is_action_just_pressed("pause") and not paused:
		pause_game()
		paused = true
	elif Input.is_action_just_pressed("pause") and paused:
		unpause_game()
		paused = false

func pause_game():
	get_tree().paused = true
	$Continue.show()

func unpause_game():
	$Continue.hide()
	get_tree().paused = false

func _on_continue_pressed():
	unpause_game()
