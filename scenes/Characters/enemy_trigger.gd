extends Area2D


@export_range(0,99) var first_number = 2
@export_range(0,99) var second_number = 2
@export_enum("+","-","x","/") var operator = "x"
@onready var question = "%2d x %2d = " % [first_number,second_number]
@export var question_label:Node
@export var question_ui:Node
@export var player:Node
@export var answer_list : Array[Node]
var rng = RandomNumberGenerator.new()
func calcCorrectAnswer() -> int:
	match operator:
		"+": return first_number + second_number
		"-": return first_number - second_number
		"x": return first_number * second_number
		"/": return first_number / second_number
#	TODO: Add error handle for default. If everything set properly this should not run
		_: return -1
@onready var correct_answer = calcCorrectAnswer()
#var selected_answer 

# question number operation number = answer
# question display one at a time
# assume no enemy overlap

func numberOrQuestionMark(number) -> String:
	if(number == null) : return "?"
	return "%5d" % number


@onready var dialog_text: String = question + numberOrQuestionMark(player.selected_answer)


func generateOptions(answer:int) -> Array :
	var option_len = len(answer_list)
	var answer_position = rng.randi_range(0,option_len - 1)
	var answers = []
	for i in range(0,option_len):
		if (i == answer_position): answers.append(answer)
		else:
			var offset = rng.randi_range(-50,50)
			var false_answer = max(answer + offset,0)
			answers.append(false_answer)
	return answers

# Called when the player enters the NPC's detection area
func _on_body_entered(body: Node) -> void:
	if body.name == "Wizard":
		show_dialog()

# Called when the player exits the NPC's detection area
func _on_body_exited(body: Node) -> void:
	if body.name == "Wizard":
		hide_dialog()

# Function to trigger dialog display
func show_dialog() -> void:
	# Show the dialog UI or trigger any dialog system you have s a child node of the NPC
	question_label.text = dialog_text
	question_ui.visible = true

# Function to hide the dialog when the player leaves the area
func hide_dialog() -> void:
	question_ui.visible = false


@onready var generatedOptions = generateOptions(correct_answer)




	 

#func _on_answer_a_pressed() -> void:
	#selected_answer = generatedOptions[0]
	#dialog_text = question + numberOrQuestionMark(selected_answer)
	#question_label.text = dialog_text
#
#func _on_answer_b_pressed() -> void:
	#selected_answer = generatedOptions[1]
	#dialog_text = question + numberOrQuestionMark(selected_answer)
	#question_label.text = dialog_text
#
#func _on_answer_c_pressed() -> void:
	#selected_answer = generatedOptions[2]
	#dialog_text = question + numberOrQuestionMark(selected_answer)
	#question_label.text = dialog_text
#
#func _on_answer_d_pressed() -> void:
	#selected_answer = generatedOptions[3]
	#dialog_text = question + numberOrQuestionMark(selected_answer)
	#question_label.text = dialog_text

	


func _on_ready() -> void:
	for i in range(0,len(answer_list)):
		answer_list[i].answer = str(generatedOptions[i]) 


func _on_confirm_pressed() -> void:
	var status = correct_answer == player.selected_answer
	if(status) : 
		print("true")
		var enemy = $".."
		dialog_text = "correct"
		question_label.text = dialog_text
		await get_tree().create_timer(1).timeout
		enemy.queue_free()
		
	else: 
		print("false")
		print(correct_answer)
		print(player.selected_answer)
