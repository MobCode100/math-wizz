extends Node2D
#var first_number = questionNode.first_number
#var second_number = questionNode.second_number
#var operator = questionNode.operator
#@export var questionNode:Node:
	#get:
		#return questionNode
	#set(qn):
		#questionNode = qn
		#first_number = questionNode.first_number
		#second_number = questionNode.second_number
		#operator = questionNode.operator
#
#@export var question_label:Node
#@export var question_ui:Node
#
#@onready var question = "%2d %s %2d = " % [first_number,operator,second_number]
#
#var rng = RandomNumberGenerator.new()
#var selected_answer 
#
#func calcCorrectAnswer() -> int:
	#match operator:
		#"+": return first_number + second_number
		#"-": return first_number - second_number
		#"x": return first_number * second_number
		#"/": return first_number / second_number
##	TODO: Add error handle for default. If everything set properly this should not run
		#_: return -1
#
#@onready var correct_answer = calcCorrectAnswer()
#
#func numberOrQuestionMark(number) -> String:
	#if(number == null) : return "?"
	#return "%5d" % number

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
