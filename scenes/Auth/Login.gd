extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	print("insert path %s" % current_scene_filename)
	GlobalSceneManager.insert_scene(current_scene_filename)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed(): 
	$HTTPRequest.request(
		Env.API_URL + "/login",
		["Content-Type: application/json"],
		HTTPClient.Method.METHOD_POST,
		JSON.stringify({
			"username": $VBoxContainer/usernameInput.text,
			"password": $VBoxContainer/passwordInput.text
		})
	)
	
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	if(response_code == 200):
		#######################################################
		### Display success message with json.message if needed
		#######################################################
		Session.player_data = json.data[0]
		if(Session.player_data.is_admin):
			get_tree().change_scene_to_file("res://scenes/Main Menu/Admin.tscn")
			return
		
		get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
