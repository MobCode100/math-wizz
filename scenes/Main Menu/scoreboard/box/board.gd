extends HBoxContainer
@onready var position_label = %position
@onready var name_label = %name
@onready var index:int:
	get: return index
	set(value):
		index = value
		position_label.text = "%d." % (index + 1)
		
@onready var username:String:
	get: return username
	set(value):
		username = value
		name_label.text = username
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
