extends Node

var value : float = -6.0
var touch_borders : bool = false
var air : int = 100
var fear_high : bool = false
var sanity = 100

func change_direction():
	value *= -1

func increase_air():
	air += 5
