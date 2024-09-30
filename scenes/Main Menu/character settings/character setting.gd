extends Node2D

@onready var user_update_service = %"user update service"
@onready var skin_index = %"Character Selector"
@export var main_menu:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_save_pressed() -> void:
	pass


func _on_back_pressed() -> void:
	#print("go to %s" % main_menu.resource_name)
	get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
