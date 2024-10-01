extends Node2D

var users:Array
@onready var api = %"scoreboard service"
@onready var board = %board

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_users()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_users():
	api.request(
		Env.API_URL + "/fetch_user",
		["Content-Type: application/json"],
		HTTPClient.Method.METHOD_POST,
	)

func _on_scoreboard_service_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
	print(response_code)
	if(response_code == 200):		
		users = json['data']
		users.sort_custom(sort_custom)
		#users.filter(filter_custom)
		board.sorted_name = users.filter(filter_custom)
	#else:
		#error_msg = json['message']
		#if !error_msg.is_empty():
			#error_label.text = "code %d: %s" % [response_code,error_msg]
			#error_label.visible = true

func sort_custom(a:Dictionary,b:Dictionary):
	return a['highest_score'] > b['highest_score']

func filter_custom(a:Dictionary):
	return !a['is_admin']


func _on_back_pressed() -> void:
	print("go to main mennu")
	get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
