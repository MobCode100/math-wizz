extends Node


@onready var player_data_node = %"Player Data"
@onready var scene_selector = %"Scene Selector"
@onready var time_keeper = %"Time Keeper"
@onready var api = $"score service"
@export var defeat_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	GlobalSceneManager.insert_scene(current_scene_filename)
	load_current_scene()
	time_keeper.time_left


func load_scene(scene):
	if(scene == null): 
		on_finished_dungeon()
	else:
		call_deferred("scene_setup",scene)
		#scene_setup(scene)
	
func load_current_scene():
	var scene = scene_selector.current_scene
	print("load_current_scene")
	load_scene(scene)
	
func load_next_scene():
	var scene = scene_selector.get_next_scene()
	print("load_next_scene")
	load_scene(scene)
		
func scene_setup(scene:Node):
	add_child(scene)
	#call_deferred("add_child",scene)
	scene.connect("next_scene",self.on_next_scene)
	scene.connect("player_died",on_player_died)
	scene.init_player_data(player_data_node.player_data)
	scene.give_timer_to_player(time_keeper)
	
func on_next_scene():
	print("load")
	update_player_data()
	load_next_scene()

func update_player_data():
	var scene = scene_selector.current_scene
	var current_player_data = scene.get_player_data()
	player_data_node.update_player_data(current_player_data)

func free_scene_and_get_player_data():
	var scene = scene_selector.current_scene
	var player_data = scene.get_player_data()
	scene.queue_free()
	return player_data

func _on_time_keeper_timeout() -> void:
	var player_data = free_scene_and_get_player_data()
	update_player_high_score(player_data)
	var defeat_instance = defeat_scene.instantiate()
	add_child(defeat_instance)
	defeat_instance.timeout(player_data['points'])

func on_player_died():
	var player_data = free_scene_and_get_player_data()
	update_player_high_score(player_data)
	var defeat_instance = defeat_scene.instantiate()
	add_child(defeat_instance)
	defeat_instance.no_life(player_data['points'])
	
func on_finished_dungeon():
	var player_data = free_scene_and_get_player_data()
	update_player_high_score(player_data)
	var defeat_instance = defeat_scene.instantiate()
	add_child(defeat_instance)
	defeat_instance.the_end(player_data['points'])

func update_player_high_score(data:Dictionary):
	var high_score = Session.player_data['highest_score']
	var current_score = data['points']
	
	if current_score <= high_score : return
	Session.player_data['highest_score'] = current_score
	api.request(
		Env.API_URL + "/update_user",
		["Content-Type: application/json"],
		HTTPClient.Method.METHOD_POST,
		JSON.stringify({
			"username": Session.player_data['username'],
			"highest_score": current_score
		})
	)

func _on_score_service_request_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
	print(response_code)
	#if(response_code == 200):
		#Session.player_data['highest_score'] = player_data['points']
		
	#else:
		#error_msg = json['message']
		#if !error_msg.is_empty():
			#error_label.text = "code %d: %s" % [response_code,error_msg]
			#error_label.visible = true
