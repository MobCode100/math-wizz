extends Control

@export var game_mode:PackedScene
@export var settings:PackedScene
@export var character:PackedScene
@export var scoreboard:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	GlobalSceneManager.insert_scene(current_scene_filename)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(game_mode)


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_packed(settings)


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_packed(character)


func _on_scoreboard_pressed() -> void:
	get_tree().change_scene_to_packed(scoreboard)
