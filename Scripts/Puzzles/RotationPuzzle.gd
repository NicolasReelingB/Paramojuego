class_name RotationPuzzle

var elements: int
var solution: Array
var solved: bool = false

func _init(elements: int, solution: Array):
	self.elements = elements
	self.solution = solution

func validate_solution(positions: Array):
	for i in elements:
		if solution[i] != positions[i]:
			return false
	
	solved = true
	return true

func is_solved():
	return solved
