extends CharacterBody2D

# question <number> <operation> <number> = <answer>
# question display one at a time
# assume no enemy overlap


@export_range(0,99) var first_number = 2
@export_range(0,99) var second_number = 2
@export_enum("+","-","x","/") var operator = "x"
@onready var question = "%2d %s %2d = " % [first_number,operator,second_number]
@export var main_scene:Node
@onready var correct_answer = calcCorrectAnswer()
@onready var generatedOptions = generateOptions(correct_answer,4)

#@export var answer_list : Array[Node]
var rng = RandomNumberGenerator.new()

func calcCorrectAnswer() -> int:
	match operator:
		"+": return first_number + second_number
		"-": return first_number - second_number
		"x": return first_number * second_number
		"/": return first_number / second_number
#	TODO: Add error handle for default. If everything set properly this should not run
		_: return -1

func generateOptions(answer:int,option_len:int) -> Array :
#	don't generate new when it is already generated	
	if(generatedOptions != null): return generatedOptions
	var answer_position = rng.randi_range(0,option_len - 1)
	var answers = []
	for i in range(0,option_len):
		if (i == answer_position): answers.append(answer)
		else:
			var offset = rng.randi_range(-50,50)
			var false_answer = max(answer + offset,0)
			answers.append(false_answer)
	return answers

#func numberOrQuestionMark(number) -> String:
	#if(number == null) : return "?"
	#return "%5d" % number


# Called when the player enters the NPC's detection area
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Wizard":
		show_dialog()

# Called when the player exits the NPC's detection area
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Wizard":
		hide_dialog()

# Function to trigger dialog display
func show_dialog() -> void:
	main_scene.enemy = self
	

# Function to hide the dialog when the player leaves the area
func hide_dialog() -> void:
	main_scene.enemy = null

func isAnswerCorrect(answer:int) : 
	return correct_answer == answer

func die():
	await get_tree().create_timer(1).timeout
	self.queue_free()
