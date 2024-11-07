extends Node

var v_master_index = AudioServer.get_bus_index("Master")
var v_music_index = AudioServer.get_bus_index("Music")
var v_sfx_index = AudioServer.get_bus_index("SFX")


@onready var master_volume:float = AudioServer.get_bus_volume_db(v_master_index):
	get: return master_volume
	set(value): 
		master_volume = value
		AudioServer.set_bus_volume_db(v_master_index,value)
		saving_file()
		
@onready var music_volume:float = AudioServer.get_bus_volume_db(v_music_index):
	get: return music_volume
	set(value): 
		music_volume = value
		AudioServer.set_bus_volume_db(v_music_index,value)
		saving_file()
		
@onready var sfx_volume:float = AudioServer.get_bus_volume_db(v_sfx_index):
	get: return sfx_volume
	set(value): 
		sfx_volume = value
		AudioServer.set_bus_volume_db(v_sfx_index,value)
		saving_file()
		
const FILEPATH = "user://settings.save"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("file at dir %s" % OS.get_data_dir())
	load_file()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func saving_file():
	var settings_dict = to_dict()
	var save_file = FileAccess.open(FILEPATH, FileAccess.WRITE)
	var json_string = JSON.stringify(settings_dict)
	print("saving settings")
	save_file.store_line(json_string)

func load_file():
	if not FileAccess.file_exists(FILEPATH):
		return
	var save_file = FileAccess.open(FILEPATH, FileAccess.READ)
	var json_string = save_file.get_line()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return
	var settings_data = json.get_data()
	from_dict(settings_data)

func to_dict()->Dictionary:
	return {
		'master_volume' : master_volume,
		'music_volume' : music_volume,
		'sfx_volume' : sfx_volume
	}

func from_dict(data:Dictionary):
	master_volume = data['master_volume']
	music_volume = data['music_volume']
	sfx_volume = data['sfx_volume']
