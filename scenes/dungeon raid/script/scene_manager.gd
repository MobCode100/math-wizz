extends Node

@export var scenes:Array[PackedScene]  #stores scene to be played
var current_scene_index = 0
var current_scene:Node
var available_scene_index:Array[int] = []
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	free_current_scene()
	init_available_scene()
	var scene = scenes[current_scene_index].instantiate()
	remove_available_scene(current_scene_index)
	#played_scene_index.append(current_scene_index)
	current_scene = scene

func get_random_scene_index():
	if len(available_scene_index) == 1: return 
	var last_item_index = len(available_scene_index) - 1
	var selected_scene_index = rng.randi_range(0,last_item_index)
	var new_scene_index = available_scene_index[selected_scene_index]
	while (current_scene_index == new_scene_index):
		selected_scene_index = rng.randi_range(0,last_item_index)
		new_scene_index = available_scene_index[selected_scene_index]
	return new_scene_index

func get_next_scene():
	current_scene_index = get_random_scene_index()
	if(current_scene_index == null): return
	var scene = scenes[current_scene_index].instantiate()
	free_current_scene()
	current_scene = scene
	remove_available_scene(current_scene_index)
	
	return current_scene


func free_current_scene():
	if(current_scene != null): current_scene.queue_free()

func init_available_scene():
	var indexes:Array[int] = []
	for i in range(len(scenes)):
		indexes.append(i)
	available_scene_index = indexes

func remove_available_scene(index:int):
	available_scene_index = available_scene_index.filter(func(x):return x != index)
	
