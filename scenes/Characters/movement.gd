extends TouchScreenButton

@export var input_action:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func button_down() -> void:
	print("button_down")
	Input.action_press(input_action)

func button_up() -> void:
	print("button_up")
	Input.action_release(input_action)
