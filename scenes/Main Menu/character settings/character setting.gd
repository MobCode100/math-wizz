extends Node2D

@onready var api = %"user update service"
@onready var skin_index = %"Character Selector"
@onready var display_name_input = %"display name"
@onready var message = %message

var error_msg:String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	message.visible = false
	display_name_input.text = Session.player_data['name']

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_save_pressed() -> void:
	var username = Session.player_data['username']
	var display_name:String = display_name_input.text
	if display_name.is_empty(): return 
	api.request(
		Env.API_URL + "/update_user",
		["Content-Type: application/json"],
		HTTPClient.Method.METHOD_POST,
		JSON.stringify({
			"username": username,
			"name": display_name
		})
	)


func _on_back_pressed() -> void:
	#print("go to %s" % main_menu.resource_name)
	get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")


func _on_user_update_service_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
	print(response_code)
	if(response_code == 200):
		# because update does not return data
		Session.player_data['name'] = display_name_input.text
		
	error_msg = json['message']
	if !error_msg.is_empty():
		message.text = "%s" % error_msg
		message.visible = true
