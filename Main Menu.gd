extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	GlobalSceneManager.insert_scene(current_scene_filename)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Main Menu/Game Mode.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI element/settings/settings.tscn")
