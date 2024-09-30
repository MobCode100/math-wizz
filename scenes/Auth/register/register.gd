extends Node2D

@onready var error_label = %error
@onready var register_api = %register
@onready var username_input = %usernameInput
@onready var password_input = %passwordInput
@onready var name_input = %nameInput

var error_msg:String

@export var login:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	error_label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	register_api.request(
		Env.API_URL + "/register",
		["Content-Type: application/json"],
		HTTPClient.Method.METHOD_POST,
		JSON.stringify({
			"username": username_input.text,
			"password": password_input.text,
			"name": name_input.text
		})
	)



func _on_register_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
	print(response_code)
	if(response_code == 200):		
		get_tree().change_scene_to_packed(login)
	else:
		error_msg = json['message']
		if !error_msg.is_empty():
			error_label.text = "code %d: %s" % [response_code,error_msg]
			error_label.visible = true


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_packed(login)
