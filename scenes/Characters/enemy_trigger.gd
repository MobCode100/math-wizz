extends CharacterBody2D
class_name Enemy
# question <number> <operation> <number> = <answer>
# question display one at a time
# assume no enemy overlap

const ENEMY = true

@export_range(0,99) var first_number = 2:
	get:return first_number
	set(value):
		first_number = value
		_update_values()
@export_range(0,99) var second_number = 2:
	get:return second_number
	set(value):
		second_number = value
		_update_values()
@export_enum("+","-","x","/") var operator = "x":
	get:return operator
	set(value):
		operator = value
		_update_values()
@export_range(0,99) var question_range = 10

@export var main_scene:Node

@onready var question = "%2d %s %2d = " % [first_number,operator,second_number]
@onready var correct_answer = calcCorrectAnswer()
var generatedOptions:Array[int]

const SPEED = 300.0
const JUMP_VELOCITY = -300.0



func calcCorrectAnswer() -> int:
	match operator:
		"+": return first_number + second_number
		"-": return first_number - second_number
		"x": return first_number * second_number
		"/": return first_number / second_number
#	TODO: Add error handle for default. If everything set properly this should not run
		_: return -1

var rng = RandomNumberGenerator.new()
func generateOptions(option_len:int) -> Array[int] :
	if(len(generatedOptions) != option_len): 
		var answer_position = rng.randi_range(0,option_len - 1)
		var answers:Array[int] = []
		for i in range(0,option_len):
			if (i == answer_position): answers.append(correct_answer)
			else:
				var offset = rng.randi_range(-question_range,question_range)
				var option = int(correct_answer + offset)
				# no negative number or duplicate
				# but still has duplicate WHY?
				# seems to only happen to correct answer
				# bodge solution: check for correct answer
				while(option <= 0 || option in answers || option == correct_answer):
					offset = rng.randi_range(-question_range,question_range)
					option = int(correct_answer + offset)
				var false_answer = max(option,0)
				answers.append(false_answer)
		generatedOptions = answers
	return generatedOptions


#func numberOrQuestionMark(number) -> String:
	#if(number == null) : return "?"
	#return "%5d" % number




func isAnswerCorrect(answer:int) : 
	return correct_answer == answer

func die():
	$AnimatedSprite2D.play("hit")
	$AudioStreamPlayer2D.play()
	await $AnimatedSprite2D.animation_finished
	self.queue_free()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move_and_slide()

func _update_values():
		correct_answer = calcCorrectAnswer()
		question = "%2d %s %2d = " % [first_number,operator,second_number]
