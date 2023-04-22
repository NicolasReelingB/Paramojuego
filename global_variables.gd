extends Node

var value : float = -400.0
var touch_borders : bool = false
var air : int = 100
var fear_high : bool = false
var sanity = 100

var current_stage : int = 0
var spawn_points : Array[Transform3D] = [
	Transform3D.IDENTITY,
	Transform3D.IDENTITY,
	Transform3D.IDENTITY,
	Transform3D.IDENTITY,
	Transform3D.IDENTITY,
	Transform3D.IDENTITY
]

func get_spawn_points(stage_id: int) -> Transform3D:
	return spawn_points[stage_id]

func change_direction():
	value *= -1

func increase_air():
	air += 5
