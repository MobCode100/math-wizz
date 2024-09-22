extends Node2D

var points:int = 0
var next_scene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	points = VictoryVariable.points
	next_scene = VictoryVariable.next_scene
	$CenterContainer/VBoxContainer/point.text = "%d points" % points
	$CenterContainer/VBoxContainer/Button.text = "Main Menu" if next_scene == null else "Next Chapter"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
		if(next_scene == null) : get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
		else : 
			get_tree().change_scene_to_packed(next_scene)
			
