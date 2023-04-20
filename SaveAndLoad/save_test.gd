extends Node

var save_load_data: SaveLoadData = SaveLoadData.new()
var _game_data: GameData = GameData.new()
var _inventory: InventoryData = InventoryData.new()

func _ready():
	_game_data = save_load_data.load_game_data()
	_inventory = _game_data.inventory
	
	_game_data.print_data()
	print(_inventory.slot_datas)
	
	for item in _inventory.slot_datas:
		if item != null:
			print(item.item_data.name)
