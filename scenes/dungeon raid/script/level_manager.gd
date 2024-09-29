extends Node2D
class_name DungeonLevel

@onready var next_area:Area2D = $"Next Level"
@onready var wizard:Wizard = $Wizard
signal next_scene
signal player_died




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_area.connect("body_entered",go_next_scene)
	wizard.died.connect(emit_player_died)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func go_next_scene(body:Node2D):
	
	print("next scene %s" % body.name)
	# need this filter because collusion can detect map layer
	if(body is Wizard):
		emit_signal("next_scene")

func init_player_data(data:Dictionary):
	print("init player in scene")
	wizard.update_player_data(data)

func get_player_data():
	var player_data = {
		'points': wizard.score,
		'health': wizard.health,
		'max_health': wizard.MAX_HEALTH
	}
	
	return player_data

func emit_player_died():
	emit_signal("player_died")

func give_timer_to_player(time_keeper:Timer):
	wizard.time_keeper = time_keeper
