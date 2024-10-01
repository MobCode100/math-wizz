extends Node2D

@export var restart_chapter:String
@onready var player = $Wizard

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	GlobalSceneManager.insert_scene(current_scene_filename)
	player.connect("died",self.on_defeated)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_defeated():
	print("defeat")
	VictoryVariable.next_scene = load(restart_chapter)
	VictoryVariable.points = player.score
	get_tree().change_scene_to_file("res://scenes/chapter/defeat.tscn")
