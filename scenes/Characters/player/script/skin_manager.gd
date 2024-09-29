extends Node2D

@export var skin_scene:Array[PackedScene]
@export var current_index = 0

func _ready() -> void:
#	TODO:get from file
	current_index = 0


func get_current_skin()-> PackedScene:
	return skin_scene[current_index]
