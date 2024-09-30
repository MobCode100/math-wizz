extends Node

static var API_URL

func _ready() -> void:
	Dotenv.load_("res://project.env")
	API_URL = OS.get_environment("API_URL")
