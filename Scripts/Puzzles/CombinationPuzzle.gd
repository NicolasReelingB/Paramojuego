class_name CombinationPuzzle

var length: int
var solution: String
var solved: bool = false

func _init(length: int, solution: String):
	self.length = length
	self.solution = solution

func validate_solution(solution: String):
	solved = self.solution == solution
	return solved

func is_solved():
	return solved

func print_attrs():
	print(str(length) + " " + str(solution))
