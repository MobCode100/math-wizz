extends Node2D

var points:int = 0 : 
	get:
		return points
	set(value):
		points = value
		point_label.text = "%d points" % points
	
var next_scene:PackedScene
@onready var point_label = %point
@onready var exit_button = %Button
@onready var cause_label = %cause
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	point_label.text = "%d points" % points
	exit_button.text = "Main Menu" if next_scene == null else "Next Chapter"

func timeout(point:int):
	points = point
	cause_label.text = "TIMEOUT"

func no_life(point:int):
	points = point
	cause_label.text = "DEFEAT"

func _on_button_pressed() -> void:
		if(next_scene == null) : get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
		else : 
			get_tree().change_scene_to_packed(next_scene)