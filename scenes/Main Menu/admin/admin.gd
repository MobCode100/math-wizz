extends Node2D
# Assuming data fetching are already made with json, and now jsonData is the parsed object
var jsonData = [
	{
		"id": 1,
		"username": "user1jadudhauhdsuadaudhsaudhaudhasudhasduashduasdhasdhusa",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
	{
		"id": 1,
		"username": "user1",
		"name": "user1",
		"password": "pass1",
		"is_admin": 1,
		"score": 123
	},
]

func add_text_field(row: HBoxContainer,text: String, type = Label) -> void:
	var field = type.new()
	field.text = text
	row.add_child(field)

func table_contents(users: Array,table: TableContainer) -> void:
	var columns = ["ID","Username","Name","Password","Admin","Max Score"]
	var header_row = HBoxContainer.new()
	header_row.alignment = HBoxContainer.ALIGNMENT_CENTER
	for column in columns:
		var header_column = Label.new()
		header_column.text = column
		header_row.add_child(header_column)
	table.add_child(header_row)
	
	for user in users:
		var row = HBoxContainer.new()
		row.alignment = HBoxContainer.ALIGNMENT_CENTER
		add_text_field(row,str(user["id"]))
		add_text_field(row,user["username"])
		add_text_field(row,user["name"])
		add_text_field(row,user["password"])
		add_text_field(row,str(user["is_admin"]))
		add_text_field(row,str(user["score"]))
		table.add_child(row)

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene_filename = get_tree().current_scene.scene_file_path
	print("insert path %s" % current_scene_filename)
	GlobalSceneManager.insert_scene(current_scene_filename)
	table_contents(jsonData,$CanvasLayer/VBoxContainer/ScrollContainer/TableContainer)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
