extends Node2D

@export var rotation_speed = PI
@export var init_positions = [0, 0]
@export var solution = [0, 0]

var puzzle: RotationPuzzle
var outer_delta = 90
var inner_delta = 45
var outer_target_angle = init_positions[0]
var inner_target_angle = init_positions[1]

func _ready():
	puzzle = RotationPuzzle.new(2, solution)

func _process(delta):
	if Input.is_action_just_pressed("check_puzzle"):
		print(check_positions())
		print(solution)
		print(puzzle.validate_solution(check_positions()))
	
	#Pentagram movement
	var up_input = Input.is_action_just_pressed("ui_up")
	var down_input = Input.is_action_just_pressed("ui_down")
	var left_input = Input.is_action_just_pressed("ui_left")
	var right_input = Input.is_action_just_pressed("ui_right")
	
	$OuterCircle.rotation_degrees += outer_delta * (int(up_input) - int(down_input))
	$InnerCircle.rotation_degrees += inner_delta * (int(left_input) - int(right_input))
	
	"""outer_target_angle += outer_delta * (int(up_input) - int(down_input)) * rotation_speed
	inner_target_angle += inner_delta * (int(left_input) - int(right_input)) * rotation_speed
	
	var outer_angle = lerp_angle(deg_to_rad($OuterCircle.rotation_degrees), deg_to_rad(outer_target_angle), 1.0)
	var inner_angle = lerp_angle(deg_to_rad($InnerCircle.rotation_degrees), deg_to_rad(inner_target_angle), 1.0)
	
	var outer_sub = deg_to_rad($OuterCircle.rotation_degrees) - deg_to_rad(outer_target_angle)
	var outer_add = deg_to_rad($OuterCircle.rotation_degrees) + deg_to_rad(outer_target_angle)
	var inner_sub = deg_to_rad($InnerCircle.rotation_degrees) - deg_to_rad(inner_target_angle)
	var inner_add = deg_to_rad($InnerCircle.rotation_degrees) + deg_to_rad(inner_target_angle)
	
	outer_angle = clamp(outer_angle, outer_sub, outer_add)
	inner_angle = clamp(inner_angle, inner_sub, inner_add)
	
	$OuterCircle.rotation = outer_angle
	$InnerCircle.rotation = inner_angle"""

func check_positions():
	var outer_position = int(filter_angle($OuterCircle.rotation_degrees) / outer_delta) % 4
	var inner_position = int(filter_angle($InnerCircle.rotation_degrees) / inner_delta) % 8
	
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
