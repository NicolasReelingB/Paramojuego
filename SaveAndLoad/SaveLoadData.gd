class_name SaveLoadData
extends Resource

const SAVE_FILE_PATH = "user://save_data.tres"

var game_data: GameData = GameData.new()

func _init():
	load_game_data()

func save_game_data() -> void:
	game_data.update_data(Global.current_stage, Global.sanity, load("res://inventory_struct.tres"))
	ResourceSaver.save(game_data, SAVE_FILE_PATH)

func load_game_data() -> Resource:
	if not ResourceLoader.exists(SAVE_FILE_PATH):
		save_game_data()
	return ResourceLoader.load(SAVE_FILE_PATH).duplicate(true)

"""
func load_game_data():
	if not ResourceLoader.has_cached(SAVE_FILE_PATH):
		return ResourceLoader.load(SAVE_FILE_PATH)
	
	if FileAccess.open(SAVE_FILE_PATH, FileAccess.READ) != OK:
		printerr("Couldn't read file: " + SAVE_FILE_PATH)
"""
