class_name SequencePuzzle

var stages: int
var current_stage: int = 0
var solved: bool = false

func _init(stages: int):
	self.stages = stages

func next_stage(step: int):
	if solved:
		return true
	
	if step == current_stage:
		current_stage += 1
		solved = current_stage == stages
		return true
	
	return false

func is_solved():
	return solved
