extends Node

var save_load_data: SaveLoadData
var _game_data: GameData

func _ready():
	_game_data = GameData.new()
	save_load_data = SaveLoadData.new()
	
	_game_data = save_load_data.load_game_data()
	print(_game_data.sanity)
	
