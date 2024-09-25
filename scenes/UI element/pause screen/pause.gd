extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
#	this is here because the pause effect is accross all scene,
#	hence, this must be done to unpause when in main menu
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")


func _on_back_to_game_pressed() -> void:
	$".".hide()
	get_tree().paused = false
