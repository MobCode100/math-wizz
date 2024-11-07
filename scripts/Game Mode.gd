extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	GlobalSceneManager.insert_scene(current_scene_filename)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_main_quest_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Main Menu/chapter select/chapter select.tscn")


func _on_dungeon_raid_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/dungeon raid/dungeon_raid.tscn")


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
