extends VBoxContainer

@export var skins_control:Array[Control]
@onready var select_left = %"select left"
@onready var select_right = %"select right"
@onready var skin_name = %"skin name"
const FILEPATH = "user://skin.save"
var selected_skin = 0:
	get: return selected_skin
	set(value):
		if value < 0 and value >= len(skins_control): return
		selected_skin = value
		show_current_skin()
		
		


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_file()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_current_skin():
	for skin in skins_control:
		skin.visible = false
	skins_control[selected_skin].visible = true
	skin_name.text = skins_control[selected_skin].name

func _rotate_index(index:int):
	if index < 0: return len(skins_control) - 1
	if index >= len(skins_control): return 0
	return index

func _on_select_left_pressed() -> void:
	selected_skin = _rotate_index(selected_skin - 1) 
	save_file()

func _on_select_right_pressed() -> void:
	selected_skin = _rotate_index(selected_skin + 1) 
	save_file()
	
func save_file():
	var settings_dict = to_dict()
	var save_file = FileAccess.open(FILEPATH, FileAccess.WRITE)
	var json_string = JSON.stringify(settings_dict)
	print("saving skin index")
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
		'skin_index' : selected_skin,
	}

func from_dict(data:Dictionary):
	selected_skin = data['skin_index']
