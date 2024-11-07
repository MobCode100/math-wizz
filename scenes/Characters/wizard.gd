extends CharacterBody2D
class_name Wizard

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@export var selected_answer:int = -1
@export var selected_sprite: Array[AnimatedSprite2D]
@export_range(0,1) var sprite_index = 0:
	get: return sprite_index
	set(value):
		sprite_index = value
		for skin in selected_sprite:
			skin.visible = false
			selected_sprite[sprite_index].visible = true
			
signal answer_change(answer:int)
signal died
signal score_updated
signal health_updated

var time_keeper:Timer
@onready var time_label = %"Time Left"

func _process(delta: float) -> void:
	time_label.visible = time_keeper != null
	if(time_keeper != null):
		time_label.text = "time left: %d" % time_keeper.time_left

@onready var sprite:AnimatedSprite2D = selected_sprite[sprite_index]

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$jump.play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := 0
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	
	player_animation_direction(direction)
	if direction != 0:
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
	hide_question()
	init_health_bar()
	$UI.visible = true
	$pause.visible = false
	load_file()
	
	
	
# TODO: export to player please
@onready var option_list:Array[Node] = [
	$"UI/question/answer A",
	$"UI/question/answer B",
	$"UI/question/answer C",
	$"UI/question/answer D",
]
@onready var question_label:Label = $UI/question/Label
@onready var question_ui:Node2D = $UI/question
@onready var score_label:Label = $UI/MarginContainer2/Score
@onready var confirm_button:Button = $UI/question/MarginContainer/confirm
@onready var health_bar:HealthBar = %"Health Bar"

@export var MAX_HEALTH = 3


var score = 0
var health = MAX_HEALTH

var enemy:Enemy

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body is Enemy)
	if(body is Enemy):
		enemy = body
		show_question()
		update_options(enemy.generateOptions(len(option_list)))
		update_question(enemy.question)
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body is Enemy):
		hide_question() # UI
		enable_button() # UI
		enemy = null

func _on_confirm_pressed() -> void:
	print(selected_answer)
	var correct = enemy.isAnswerCorrect(selected_answer)
	if(correct):
		display_answer_is_correct() # UI
		update_score(enemy.operator) # UI
		disble_button() # UI
		update_score_ui() # UI
		kill_enemy() 
	else:
		disble_button() # UI
		$hurt.play()
		display_answer_is_incorrect() # UI
		update_health() # UI
		update_health_bar() # UI
		await wait(1)
		enable_button() # UI		update_question(enemy.question) # UI
		update_question(enemy.question)
		
		if(health <= 0):
			#print("died")
			emit_signal("died")
			#restart_level()
	
	selected_answer = -1
			#go_to_main_menu()



func not_enemy(body:Node2D)->bool : return "ENEMY" not in body || !body.ENEMY

func update_question(question:String):question_label.text = "%s %s" % [question,display_question_mark_when_answer_empty()]
func hide_question(): question_ui.visible = false
func show_question(): question_ui.visible = true
func display_answer_is_correct(): question_label.text = "correct"
func display_answer_is_incorrect(): question_label.text = "incorrect"
func display_question_mark_when_answer_empty() -> String:
	return str(selected_answer) if selected_answer >= 0 else "?"
func update_options(generatedOptions:Array[int]):
	for i in range(0,len(option_list)):
		option_list[i].answer = str(generatedOptions[i]) 

func CalcScore(operator:String) -> int:
	match operator:
		"+": return enemy.first_number + enemy.second_number + enemy.correct_answer
		"-": return enemy.first_number + enemy.second_number + enemy.correct_answer
		"x": return (enemy.first_number + enemy.second_number + enemy.correct_answer) * 2
		"/": return (enemy.first_number + enemy.second_number + enemy.correct_answer) * 2
		_: return 0

func update_score_ui(): score_label.text = "score %4d" % score
func update_score(operator:String): 
	score += CalcScore(operator)
	emit_signal("score_updated")
# avoid spam confirm button for extra point
func disble_button() : confirm_button.disabled = true
func enable_button() : confirm_button.disabled = false

func update_health() : 
	health = max(health -1 , 0)
	emit_signal("health_updated")
	
func go_to_main_menu(): get_tree().change_scene_to_file("res://scenes/Main Menu/Main Menu.tscn")
func restart_level(): get_tree().reload_current_scene()
func wait(seconds:float): await get_tree().create_timer(seconds).timeout
func kill_enemy(): 
	if(enemy == null): return
	else: enemy.die()


func _on_answer_change(answer:int) -> void:
	selected_answer = answer
	#print("on answer change")
	#print(selected_answer)
	update_question(enemy.question)
	
func init_health_bar():
	#print("init health")
	health_bar.max_health = MAX_HEALTH
	update_health_bar()
	
func update_health_bar(): 
	health_bar.health = health

func update_player_data(data:Dictionary):
	MAX_HEALTH = data['max_health']
	health = data['health']
	score = data['points']
	update_score_ui()
	update_health_bar()

const FILEPATH = "user://skin.save"

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

func from_dict(data:Dictionary):
	print("sprite index: %d" % data['skin_index'])
	sprite_index = data['skin_index']
