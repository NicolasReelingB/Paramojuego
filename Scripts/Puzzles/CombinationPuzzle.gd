class_name CombinationPuzzle

var length: int
var solution: String
var solved: bool = false

func _init(solution: String):
	length = solution.length()
	self.solution = solution

func validate_solution(solution: String):
	solved = self.solution == solution
	return solved

func is_solved():
	return solved
