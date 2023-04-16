extends Node

var value : int = -8
var touch_borders : bool = false
var air : int = 100

func change_direction():
	value *= -1

func increase_air():
	air += 5
