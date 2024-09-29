extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	print("insert path %s" % current_scene_filename)
	GlobalSceneManager.insert_scene(current_scene_filename)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed(): 
	
	if $VBoxContainer/usernameInput.text == "admin":
		get_tree().change_scene_to_file("res://scenes/Main Menu/Admin.tscn")
		return
	
	get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
