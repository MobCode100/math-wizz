extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_pressed() -> void:
	OS.shell_open("https://www.youtube.com/watch?v=S8Qeif_Cucg")


func _on_sub_pressed() -> void:
	OS.shell_open("https://www.youtube.com/watch?v=I6jinLA1AxA")


func _on_multi_pressed() -> void:
	OS.shell_open("https://www.youtube.com/watch?v=PZjIT9CH6bM")


func _on_div_pressed() -> void:
	OS.shell_open("https://www.youtube.com/watch?v=HJYHNxS64f0")
