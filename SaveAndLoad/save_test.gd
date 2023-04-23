extends Node

var save_load_data: SaveLoadData = SaveLoadData.new()
var _game_data: GameData = GameData.new()
var _inventory: InventoryData = InventoryData.new()
var player_inventory: InventoryData

@onready var player: CharacterBody3D = $Player
@onready var inventory_interface: Control = $UI/InventoryInterface

func _ready():
	player.toggle_inventory.connect(toggle_inventory_interface)
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
	
	inventory_interface.set_player_inventory_data(player_inventory)

#func _process(delta):
	#if Input.is_action_just_pressed("pause"):
	#	PauseMenu.pause_game()
	
#	if Input.is_action_just_pressed("save"):
#		print("Saving data...")
#		save_load_data.save_game_data($Player.get("inventory_data").slot_datas)

func toggle_inventory_interface() -> void:
	inventory_interface.visible = not inventory_interface.visible
	if inventory_interface.visible:
		inventory_interface.toggle_letter_interface.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if inventory_interface.letter_viewer.visible:
		inventory_interface.letter_viewer.visible = not inventory_interface.letter_viewer.visible
