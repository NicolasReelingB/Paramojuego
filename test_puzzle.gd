extends Node

#var puzzle = CombinationPuzzle.new("1583")
var puzzle = SequencePuzzle.new(3)

func _ready():
	print(puzzle.next_stage(0))
	print(puzzle.next_stage(2))
	print(puzzle.next_stage(0))
	print(puzzle.next_stage(1))
	print(puzzle.next_stage(2))
	print(puzzle.next_stage(0))
	print(puzzle.next_stage(2))

func _process(delta):
	#puzzle.print_attrs()
	
	#print(puzzle.validate_solution("4283"))
	#print(puzzle.next_stage(0))
	
	#print("Solved: " + str(puzzle.is_solved()))
	
	pass
