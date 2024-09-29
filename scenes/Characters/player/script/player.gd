extends Node2D

@onready var skin_manager = %"skin manager"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_skin()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func load_skin():
	var skin_node = skin_manager.get_current_skin().instantiate()
	add_child(skin_node)
