extends Node2D

var users = []
const margin_left_right = 50

func add_text_field(row: HBoxContainer,text: String) -> void:
	var field = Label.new()
	field.text = text
	var margin_cont = MarginContainer.new()
	margin_cont.add_theme_constant_override("margin_left",margin_left_right)
	margin_cont.add_theme_constant_override("margin_right",margin_left_right)
	margin_cont.add_theme_constant_override("margin_bottom",5)
	margin_cont.add_child(field)
	row.add_child(margin_cont)

func table_contents(users: Array,table: TableContainer) -> void:
	var columns = ["ID","Username","Name","Password","Admin","Score"]
	var header_row = HBoxContainer.new()
	header_row.alignment = HBoxContainer.ALIGNMENT_CENTER
	for column in columns:
		var header_column = Label.new()
		var margin_cont = MarginContainer.new()
		header_column.text = column
		margin_cont.add_theme_constant_override("margin_left",margin_left_right)
		margin_cont.add_theme_constant_override("margin_right",margin_left_right)
		margin_cont.add_theme_constant_override("margin_bottom",15)
		margin_cont.add_child(header_column)
		header_row.add_child(margin_cont)
		
		
	table.add_child(header_row)
	
	for user in users:
		var row = HBoxContainer.new()
		row.alignment = HBoxContainer.ALIGNMENT_CENTER
		add_text_field(row,str(user["id"]))
		add_text_field(row,user["username"])
		add_text_field(row,user["name"])
		add_text_field(row,user["password"])
		var admin = "No"
		if(user["is_admin"]):
			admin = "Yes"
		add_text_field(row,admin)
		add_text_field(row,str(user["highest_score"]))
		table.add_child(row)

# Called when the node enters the scene tree for the first time.
func _ready():
	# Fetch users data
	$FetchUsersList.request(
		Env.API_URL + "/fetch_user",
		["Accept: application/json"],
		HTTPClient.Method.METHOD_POST
	)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_http_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if(response_code == 200):
		var json = JSON.parse_string(body.get_string_from_utf8())
		users = json.data

		var current_scene_filename = get_tree().current_scene.scene_file_path
		print("insert path %s" % current_scene_filename)
		GlobalSceneManager.insert_scene(current_scene_filename)
		table_contents(users,$CanvasLayer/VBoxContainer/ScrollContainer/TableContainer)



func _on_edit_pressed() -> void:
	var username = $CanvasLayer/VBoxContainer/MarginContainer/HBoxContainer/Username.text
	if(username):
		$EditUser.request(
			Env.API_URL + "/fetch_user",
			["Content-Type: application/json"],
			HTTPClient.Method.METHOD_POST,
			JSON.stringify({
				"username": username
			})
		)

func _on_edit_user_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if(response_code == 200):
		var data = JSON.parse_string(body.get_string_from_utf8()).data
		if(data):
			Session.admin_selected_player = data[0]
			get_tree().change_scene_to_file("res://scenes/Main Menu/admin/edit_user.tscn")
			return
		
		$CanvasLayer/AcceptDialog.visible = true



func _on_delete_pressed() -> void:
	var username = $CanvasLayer/VBoxContainer/MarginContainer/HBoxContainer/Username.text
	if(username):
		$DeleteUser.request(
			Env.API_URL + "/fetch_user",
			["Content-Type: application/json"],
			HTTPClient.Method.METHOD_POST,
			JSON.stringify({
				"username": username
			})
		)


func _on_delete_user_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if(response_code == 200):
		var data = JSON.parse_string(body.get_string_from_utf8()).data
		if(data):
			$CanvasLayer/ConfirmationDialog.visible = true
			$CanvasLayer/ConfirmationDialog.dialog_text = "Are you sure to delete '" + data[0].username + "' user?"
			return
		
		$CanvasLayer/AcceptDialog.visible = true


func _on_confirmation_dialog_confirmed() -> void:
	$DeleteConfirmedUser.request(
		Env.API_URL + "/delete_user",
		["Content-Type: application/json"],
		HTTPClient.Method.METHOD_POST,
		JSON.stringify({
			"username": $CanvasLayer/VBoxContainer/MarginContainer/HBoxContainer/Username.text
		})
	)


func _on_delete_confirmed_user_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if(response_code == 200):
		get_tree().change_scene_to_file("res://scenes/Main Menu/admin/Admin.tscn")
