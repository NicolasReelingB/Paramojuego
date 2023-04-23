extends Node3D

@export var init_positions = [0, 0]
@export var solution = [0, 0]
@export var minute_step = 1

var puzzle: RotationPuzzle
var hour_delta: float = 30
var minute_delta: float = 6

func _ready():
	puzzle = RotationPuzzle.new(2, solution)

func _process(delta):
	if Input.is_action_just_pressed("check_puzzle"):
		print(get_time())
		print(solution)
		print(puzzle.validate_solution(get_time()))
	
	#Clock movement
	if Input.is_action_just_pressed("ui_up"):
		$ShortHand.rotation_degrees.z -= hour_delta
	elif Input.is_action_just_pressed("ui_down"):
		$ShortHand.rotation_degrees.z += hour_delta
	
	if Input.is_action_just_pressed("ui_right"):
		$LongHand.rotation_degrees.z -= minute_delta * minute_step
	elif Input.is_action_just_pressed("ui_left"):
		$LongHand.rotation_degrees.z += minute_delta * minute_step

func get_time():
	var hour = int(ceilf(filter_angle($ShortHand.rotation_degrees.z * -1)) / hour_delta) % 12
	var minute = int(ceilf(filter_angle($LongHand.rotation_degrees.z * -1)) / minute_delta) % 60
	
	return [hour, minute]

func filter_angle(angle):
	if angle >= 0 and angle <= 360:
		return angle
		
	var filtered_angle = angle
	
	while filtered_angle < 0:
		filtered_angle += 360
	
	while filtered_angle >= 360:
		filtered_angle -= 360
	
	return filtered_angle
