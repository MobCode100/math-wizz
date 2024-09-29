extends Node

var scene_stack:Array[String] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func insert_scene(scene_filename:String):
	print("new path %s" % scene_filename)
	scene_stack.push_back(scene_filename)

func go_back():
	
	if(len(scene_stack) > 0):
		var last_scene = scene_stack.pop_back()
		print("go back to %s" % last_scene)
		return scene_stack[-1]
func clear_stack():
	scene_stack = []

func new_root(scene_filename:String):
	print("new root path %s" % scene_filename)
	clear_stack()
	insert_scene(scene_filename)
