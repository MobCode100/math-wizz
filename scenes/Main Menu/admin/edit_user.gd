extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var selected = Session.admin_selected_player
	$CanvasLayer/VBoxContainer/TableContainer/UsernameRow/UsernameLineEdit.text = selected.username
	$CanvasLayer/VBoxContainer/TableContainer/NameRow/NameLineEdit.text = selected.name
	$CanvasLayer/VBoxContainer/TableContainer/PasswordRow/PasswordLineEdit.text = selected.password
	$CanvasLayer/VBoxContainer/TableContainer/AdminRow/CheckBox.button_pressed = selected.is_admin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_save_pressed() -> void:
	$Save.request(
		Env.API_URL + "/update_user",
		["Content-Type: application/json"],
		HTTPClient.Method.METHOD_POST,
		JSON.stringify({
			"username": $CanvasLayer/VBoxContainer/TableContainer/UsernameRow/UsernameLineEdit.text,
			"name": $CanvasLayer/VBoxContainer/TableContainer/NameRow/NameLineEdit.text,
			"password": $CanvasLayer/VBoxContainer/TableContainer/PasswordRow/PasswordLineEdit.text,
			"is_admin": $CanvasLayer/VBoxContainer/TableContainer/AdminRow/CheckBox.button_pressed
		})
	)



func _on_save_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if(response_code == 200):
		get_tree().change_scene_to_file("res://scenes/Main Menu/admin/Admin.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Main Menu/admin/Admin.tscn")
