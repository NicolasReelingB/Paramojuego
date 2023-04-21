extends Node

var save_load_data: SaveLoadData = SaveLoadData.new()
var _game_data: GameData = GameData.new()
var _inventory: InventoryData = InventoryData.new()
var player_inventory: InventoryData

func _ready():
	_game_data = save_load_data.load_game_data()
	_inventory.slot_datas = _game_data.inventory
	
	player_inventory = $Player.get("inventory_data")
	
	print("Saved inventory: ")
	for item in _inventory.slot_datas:
		if item != null:
			print(item.item_data.name)
	
	print("Player inventory (before): ")
	for item in player_inventory.slot_datas:
		if item != null:
			print(item.item_data.name)
	
	$Player.set("inventory_data", _inventory)
	player_inventory = $Player.get("inventory_data")
	
	print("Player inventory (after): ")
	for item in player_inventory.slot_datas:
		if item != null:
			print(item.item_data.name)

func _process(delta):
	#if Input.is_action_just_pressed("pause"):
	#	PauseMenu.pause_game()
	
	if Input.is_action_just_pressed("save"):
		print("Saving data...")
		save_load_data.save_game_data($Player.get("inventory_data").slot_datas)
