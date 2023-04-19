extends Node

@onready var ball = $Ball

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball.position.x += Global.value
