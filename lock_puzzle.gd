extends Node3D

@export var sides: int = 10
@export var rotation_speed: int = 100
@export var solution: String = "0000"

var puzzle: CombinationPuzzle

var current_index = 0
var initial_rotation
var target_rotation
var delta_rotation
var prev_number = 0

func _ready():
	puzzle = CombinationPuzzle.new(solution)
	initial_rotation = rotation
	delta_rotation = 360 / sides
	print(delta_rotation)

func _process(delta):
	if Input.is_action_just_pressed("check_puzzle"):
		check_puzzle()
	
	#Change digit position
	if Input.is_action_just_pressed("ui_right"):
		current_index = clamp(current_index + 1, 0, sides - 1)
	elif Input.is_action_just_pressed("ui_left"):
		current_index = clamp(current_index - 1, 0, sides - 1)
	
	#Change digit value
	var current_object = get_child(current_index)
	var number_rotation = current_object.rotation_degrees.x
	
	if Input.is_action_just_pressed("ui_up"):
		number_rotation += delta_rotation
	elif Input.is_action_just_pressed("ui_down"):
		number_rotation -= delta_rotation
		
	current_object.rotation_degrees.x = number_rotation
	
	#Get value of the current digit
	var number: int = get_number(current_object.rotation_degrees.x)
	
	if prev_number != number:
		print(number)
	
	prev_number = number

func get_number(digit_rotation):
	while digit_rotation < 0:
		digit_rotation += 360
	
	while digit_rotation >= 360:
		digit_rotation -= 360
	
	#return abs(ceilf(fmod(digit_rotation, 360) / delta_rotation))
	return abs((int(digit_rotation) % 360) / delta_rotation)

func check_puzzle():
	var current_combination: String = ""
		
	for child in get_children():
		current_combination += str(get_number(child.rotation_degrees.x))
		
	print(current_combination)
	print(puzzle.validate_solution(current_combination))
