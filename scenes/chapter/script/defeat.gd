extends Node2D

var points:int = 0
var next_scene:PackedScene
@onready var point_label = %point
@onready var exit_button = %Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	points = VictoryVariable.points
	next_scene = VictoryVariable.next_scene
	print(next_scene.resource_name)
	if(next_scene == null): exit_button.visible = false
	point_label.text = "%d points" % points
	#exit_button.text = "Main Menu" if next_scene == null else "Restart Chapter"



func _on_button_pressed() -> void:
	GlobalSceneManager.clear_stack()
	get_tree().change_scene_to_packed(next_scene)
	
			


func _on_button_2_pressed() -> void:
	var main_menu_path = "res://scenes/Main Menu/Main Menu.tscn"
	get_tree().change_scene_to_file(main_menu_path)
