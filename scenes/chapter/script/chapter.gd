extends Node2D

@onready var player = $Wizard
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("died",self.on_defeated)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_defeated():
	print("defeat")
	get_tree().change_scene_to_file("res://scenes/chapter/defeat.tscn")
