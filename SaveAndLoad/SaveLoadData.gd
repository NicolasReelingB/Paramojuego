class_name SaveLoadData
extends Resource

const SAVE_FILE_PATH = "user://save_data.tres"

var _game_data: GameData = GameData.new()

func _init():
	_game_data = load_game_data()

func save_game_data(inventory: Array[SlotData]) -> void:
	_game_data.update_data(Global.current_stage, Global.sanity, inventory)
	ResourceSaver.save(_game_data, SAVE_FILE_PATH)

func load_game_data() -> Resource:
	if not ResourceLoader.exists(SAVE_FILE_PATH):
		save_game_data(load("res://inventory_default.tres").slot_datas)
	return ResourceLoader.load(SAVE_FILE_PATH)
