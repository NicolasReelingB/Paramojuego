class_name GameData
extends Resource

@export var current_stage: int = 0
@export var sanity: int = 100
@export var inventory: Resource = null

func update_data(current_stage: int, sanity: int, inventory: Resource):
	self.current_stage = current_stage
	self.sanity = sanity
	self.inventory = inventory

func print_data():
	print(current_stage)
	print(sanity)
	print(inventory)
