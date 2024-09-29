extends Node

@export var scenes:Array[PackedScene] 
var current_scene_index = 0
var current_scene:Node
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	if(current_scene != null): current_scene.queue_free()
	var scene = scenes[current_scene_index].instantiate()
	current_scene = scene

func get_random_scene_index():
	var last_item_index = len(scenes) - 1
	var new_scene_index = rng.randi_range(0,last_item_index)
	while (current_scene_index == new_scene_index):
		new_scene_index = rng.randi_range(0,last_item_index)
	return new_scene_index

func get_next_scene():
	current_scene_index = get_random_scene_index()
	var scene = scenes[current_scene_index].instantiate()
	if(current_scene != null): current_scene.queue_free()
	current_scene = scene
	
	return current_scene
