extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
@export var selected_answer:int
@export var selected_sprite: Array[AnimatedSprite2D]
@export_range(0,1) var sprite_index = 1

@onready var sprite:AnimatedSprite2D = selected_sprite[sprite_index]

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	player_animation_direction(direction)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
func die(): self.queue_free()

func player_animation_direction(direction):
	if(direction > 0):
		sprite.flip_h = false
	elif (direction < 0):
		sprite.flip_h = true

func _on_ready() -> void:
	sprite.visible = true
	update_score_ui()
	update_health_ui()


# TODO: export to player please
@onready var option_list:Array[Node] = [
	$"question/GridContainer/answer A",
	$"question/GridContainer/answer B",
	$"question/GridContainer/answer C",
	$"question/GridContainer/answer D",
]
@onready var question_label:Label = $question/Label
@onready var question_ui:Node2D = $question
@onready var score_label:Label = $Score
@onready var confirm_button:Button = $question/GridContainer/MarginContainer/confirm
@onready var health_ui:Label = $Health

@export var MAX_HEALTH = 3


var score = 0
var health = MAX_HEALTH
var correct_answer = -1

var enemy:Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(not_enemy(body)): return
	enemy = body
	show_question()
	update_options(enemy.generatedOptions)
	update_question(enemy.question)
	correct_answer = enemy.correct_answer
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(not_enemy(body)): return
	hide_question()
	enable_button()
	enemy = null

func _on_confirm_pressed() -> void:
	var correct =  selected_answer == correct_answer
	if(correct):
		display_answer_is_correct()
		update_score(enemy.operator)
		disble_button()
		update_score_ui()
		kill_enemy()
	else:
		disble_button()
		display_answer_is_incorrect()
		await wait(1)
		enable_button()
		update_question(enemy.question)
		update_health()
		update_health_ui()
		if(health == 0):
			go_to_main_menu()
			
			#player.die()


func not_enemy(body:Node2D)->bool : return "ENEMY" not in body || !body.ENEMY
func update_question(question:String):question_label.text = question
func hide_question(): question_ui.visible = false
func show_question(): question_ui.visible = true
func display_answer_is_correct(): question_label.text = "correct"
func display_answer_is_incorrect(): question_label.text = "incorrect"

func update_options(generatedOptions:Array):
		for i in range(0,max(len(option_list),4)):
			print(generatedOptions[i])
			option_list[i].answer = str(generatedOptions[i]) 

func CalcScore(operator:String) -> int:
	match operator:
		"+": return 10
		"-": return 10
		"x": return 20
		"/": return 20
		_: return 0

func update_score_ui(): score_label.text = "score %4d" % score
func update_score(operator:String): score += CalcScore(operator)
# avoid spam confirm button for extra point
func disble_button() : confirm_button.disabled = true
func enable_button() : confirm_button.disabled = false

func update_health() : health = max(health -1 , 0)
func update_health_ui(): health_ui.text = "lives : %d / %d" % [health,MAX_HEALTH]
func go_to_main_menu(): get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
func wait(seconds:float): await get_tree().create_timer(seconds).timeout
func kill_enemy(): 
	if(enemy == null): return
	else: enemy.die()
