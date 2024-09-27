extends Area2D

@export var next_scene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if(body is Wizard):
		print("exiting")
		VictoryVariable.points = body.score
		VictoryVariable.next_scene = next_scene
		get_tree().change_scene_to_file("res://scenes/chapter/victory.tscn")
