extends Node3D

@export var init_positions = [0, 0]
@export var solution = [0, 0]

var puzzle: RotationPuzzle
var outer_delta = 90
var inner_delta = 45

func _ready():
	puzzle = RotationPuzzle.new(2, solution)

func _process(delta):
	if Input.is_action_just_pressed("check_puzzle"):
		print(check_positions())
		print(solution)
		print(puzzle.validate_solution(check_positions()))
	
	#Pentagram movement
	if Input.is_action_just_pressed("ui_up"):
		$OuterCircle.rotation_degrees.y += outer_delta
	elif Input.is_action_just_pressed("ui_down"):
		$OuterCircle.rotation_degrees.y -= outer_delta
	
	if Input.is_action_just_pressed("ui_right"):
		$InnerCircle.rotation_degrees.y += inner_delta
	elif Input.is_action_just_pressed("ui_left"):
		$InnerCircle.rotation_degrees.y -= inner_delta

func check_positions():
	var outer_position = int(filter_angle($OuterCircle.rotation_degrees.y) / outer_delta) % 4
	var inner_position = int(filter_angle($InnerCircle.rotation_degrees.y) / inner_delta) % 8
	
	return [outer_position, inner_position]

func filter_angle(angle):
	if angle >= 0 and angle <= 360:
		return angle
		
	var filtered_angle = angle
	
	while filtered_angle < 0:
		filtered_angle += 360
	
	while filtered_angle >= 360:
		filtered_angle -= 360
	
	return filtered_angle
