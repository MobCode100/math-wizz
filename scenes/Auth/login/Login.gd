extends Node2D

@onready var error_label = %error
@onready var login_api = %login
@onready var username_input = %usernameInput
@onready var password_input = %passwordInput

var error_msg:String
# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	print("insert path %s" % current_scene_filename)
	GlobalSceneManager.insert_scene(current_scene_filename)
	error_label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_button_pressed(): 
	login_api.request(
		Env.API_URL + "/login",
		["Content-Type: application/json"],
		HTTPClient.Method.METHOD_POST,
		JSON.stringify({
			"username": username_input.text,
			"password": password_input.text
		})
	)
	
func _on_request_completed(_result, response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	if(response_code == 200):
		#######################################################
		### Display success message with json.message if needed
		#######################################################
		Session.player_data = json.data[0]
		if(Session.player_data.is_admin):
			get_tree().change_scene_to_file("res://scenes/Main Menu/admin/Admin.tscn")
			return
		
		get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
	else:
		error_msg = json['message']
		if !error_msg.is_empty():
			error_label.text = "%s" % error_msg
		else:
			error_label.text = "an error has accured"
		error_label.visible = true


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Auth/register/register.tscn")
