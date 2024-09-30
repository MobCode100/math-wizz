extends VBoxContainer

@export var gold:PackedScene
@export var silver:PackedScene
@export var bronze:PackedScene
@export var normal:PackedScene

var sorted_name:Array[String] = [
	"gold",
	"silver",
	"bronze",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	"loser",
	
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func free_child(): 
	var children = get_children()
	for child in children:
		child.queue_free()

func box_factory(index:int) -> PackedScene:
	if(index == 0): return gold
	if(index == 1): return silver
	if(index == 2): return bronze
	return normal
		
func display():
	free_child()
	for index in range(len(sorted_name)):
		var box = box_factory(index)
		var box_instance = box.instantiate()
		add_child(box_instance)
		box_instance.index = index
		box_instance.username = sorted_name[index]
		
		
