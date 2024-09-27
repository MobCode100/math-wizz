extends Node


@onready var player_data = %"Player Data"
@onready var scene_selector = %"Scene Selector"
@onready var time_keeper = %"Time Keeper"
@export var defeat_scene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_current_scene()
	time_keeper.time_left

func load_current_scene():
	var scene = scene_selector.current_scene
	print("load_current_scene")
	scene_setup(scene)
	
func load_next_scene():
	var scene = scene_selector.get_next_scene()
	print("load_next_scene")
	scene_setup(scene)
		
func scene_setup(scene:Node):
	add_child(scene)
	scene.connect("next_scene",self.on_next_scene)
	scene.connect("player_died",on_player_died)
	scene.init_player_data(player_data.player_data)
	scene.give_timer_to_player(time_keeper)
	
func on_next_scene():
	print("load")
	update_player_data()
	load_next_scene()

func update_player_data():
	var scene = scene_selector.current_scene
	var current_player_data = scene.get_player_data()
	player_data.update_player_data(current_player_data)



func _on_time_keeper_timeout() -> void:
	var scene = scene_selector.current_scene
	var player_data = scene.get_player_data()
	scene.queue_free()
	var defeat_instance = defeat_scene.instantiate()
	add_child(defeat_instance)
	defeat_instance.timeout(player_data['points'])

func on_player_died():
	var scene = scene_selector.current_scene
	var player_data = scene.get_player_data()
	scene.queue_free()
	var defeat_instance = defeat_scene.instantiate()
	add_child(defeat_instance)
	defeat_instance.no_life(player_data['points'])
	
	
