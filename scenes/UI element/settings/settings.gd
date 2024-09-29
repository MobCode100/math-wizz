extends CanvasLayer

@onready var v_master = %v_master
@onready var v_music = %v_music
@onready var v_sfx = %v_sfx
@onready var sfx_sound = %"sfx sound"

var last_scene:Node


func _ready() -> void:
	if(last_scene != null):
		process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	v_master.value = db_to_linear(GlobalSettings.master_volume)
	v_music.value = db_to_linear(GlobalSettings.music_volume)
	v_sfx.value = db_to_linear(GlobalSettings.sfx_volume)


func _on_v_master_value_changed(value: float) -> void:
	print("master volume: %f" % value)
	if !sfx_sound.playing:
		sfx_sound.play()
	GlobalSettings.master_volume = linear_to_db(value)


func _on_v_music_value_changed(value: float) -> void:
	print("music volume: %f" % value)
	GlobalSettings.music_volume = linear_to_db(value)


func _on_v_sfx_value_changed(value: float) -> void:
	print("sfx volume: %f" % value)
	if !sfx_sound.playing:
		sfx_sound.play()
	GlobalSettings.sfx_volume = linear_to_db(value)


func _on_back_button_pressed() -> void:
		
		if(last_scene == null) : 
			var main_menu_path = "res://scenes/Main Menu/Main Menu.tscn"
			GlobalSceneManager.clear_stack()
			get_tree().change_scene_to_file(main_menu_path)
		else : 
			var settings_scene = $"."
			settings_scene.get_parent().add_child(last_scene)
			
			#var current_scene = get_tree().current_scene
			settings_scene.queue_free()
			#add_child(last_scene)
