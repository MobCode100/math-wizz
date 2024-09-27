extends Node
class_name PlayerData

var player_data:Dictionary


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_player_data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_player_data(data:Dictionary):
	print("player data updated %d" % data['points'])
	player_data = data

func init_player_data():
	player_data = {
		'points': 0,
		'health': 3,
		'max_health': 3
	}
