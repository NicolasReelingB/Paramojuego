class_name ItemPuzzle

var required_item: String
var solved: bool = false

func _init(required_item: String):
	self.required_item = required_item

func validate_item(item: String):
	if required_item == item:
		solved = true
		return true
		
	return false

func is_solved():
	return solved
