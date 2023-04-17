extends Node3D

@export var init_values = [0, 0, 0, 0] 
@export var solution: String = "0000"

var puzzle: CombinationPuzzle
var values: Array
var current_index: int = 2
var init_index: int = 2
var delta_rotation = 36
var target_rotation

func _ready():
	puzzle = CombinationPuzzle.new(solution)
	values = init_values
	print(get_child_count())
	
	for i in get_children():
		print(i)

func _process(delta):
	if Input.is_action_just_pressed("check_puzzle"):
		check_puzzle()
	
	#Change digit position
	if Input.is_action_just_pressed("ui_right"):
		current_index = clamp(current_index + 1, 2, get_child_count() - 1)
	elif Input.is_action_just_pressed("ui_left"):
		current_index = clamp(current_index - 1, 2, get_child_count() - 1)
	
	#Change digit value
	var current_object = get_child(current_index)
	var number_rotation = current_object.rotation_degrees.y
	
	if Input.is_action_just_pressed("ui_up"):
		number_rotation += delta_rotation
		values[current_index - init_index] += 1
	elif Input.is_action_just_pressed("ui_down"):
		number_rotation -= delta_rotation
		values[current_index - init_index] -= 1
	
	if values[current_index - init_index] < 0:
		values[current_index - init_index] += 10
	
	current_object.rotation_degrees.y = number_rotation
	values[current_index - init_index] %= 10
	
	#print(values[current_index])
	
func check_puzzle():
	var current_combination: String = ""
		
	for value in values:
		current_combination += str(value)
		
	print(current_combination)
	print(puzzle.validate_solution(current_combination))
