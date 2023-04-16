class_name RotationPuzzle

var elements: int
var initial_positions: Array
var solution: Array
var solved: bool = false

func _init(elements: int, initial_positions: Array, solution: Array):
	self.elements = elements
	self.initial_positions = initial_positions
	self.solution = solution

func validate_solution(positions: Array):
	for i in elements:
		if solution[i] != positions[i]:
			return false
	
	solved = true
	return true

func is_solved():
	return solved
