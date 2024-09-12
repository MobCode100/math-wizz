extends CharacterBody2D
class_name Enemy
# question <number> <operation> <number> = <answer>
# question display one at a time
# assume no enemy overlap

const ENEMY = true

@export_range(0,99) var first_number = 2
@export_range(0,99) var second_number = 2
@export_enum("+","-","x","/") var operator = "x"
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
				while((correct_answer + offset) <= 0 || (correct_answer + offset) in answers):
					offset = rng.randi_range(-question_range,question_range)
				var false_answer = max(correct_answer + offset,0)
				answers.append(false_answer)
		generatedOptions = answers
	return generatedOptions


#func numberOrQuestionMark(number) -> String:
	#if(number == null) : return "?"
	#return "%5d" % number




func isAnswerCorrect(answer:int) : 
	return correct_answer == answer

func die():
	await get_tree().create_timer(0.5).timeout
	self.queue_free()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move_and_slide()
