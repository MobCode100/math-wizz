extends Node
class_name  HealthBar

@export var max_health = 10:
	get: return max_health
	set(value):
		max_health = value
		updateMaxHealthTexture()
@export var health = 3:
	get: return health
	set(value):
		health = value
		updateHealthTexture()
		
const SPRITE_SIZE = 32



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateTextures()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func health_to_size(health:int): return health * SPRITE_SIZE

func updateTextures():
		updateMaxHealthTexture()
		updateHealthTexture()
		
func updateMaxHealthTexture(): $"max health".size = Vector2(health_to_size(max_health),SPRITE_SIZE)
func updateHealthTexture(): $health.size = Vector2(health_to_size(health),SPRITE_SIZE)
