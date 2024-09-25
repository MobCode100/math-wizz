extends CanvasLayer
@onready var option_list:Array[Node] = [
	$"question/answer A",
	$"question/answer B",
	$"question/answer C",
	$"question/answer D",
]
@onready var question_label:Label = $question/Label
@onready var question_ui:Node2D = $question
@onready var score_label:Label = $MarginContainer2/Score
@onready var confirm_button:Button = $question/MarginContainer/confirm
@onready var health_ui:Label = $Health
@onready var health_bar:HealthBar = $"MarginContainer/Health Bar"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pause_visibility_changed() -> void:
	$".".visible = !$"../pause".visible
	get_tree().paused = $"../pause".visible
