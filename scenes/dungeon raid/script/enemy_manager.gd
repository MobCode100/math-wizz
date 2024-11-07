extends Node


@export_enum("+","-","x","/") var theme_operator:String
@export_range(1,100) var question_min_range = 1
@export_range(10,100) var question_max_range = 10
@export var gradual_increase = true
var available_operator = ["+","-","x","/"]
var rng = RandomNumberGenerator.new()
var gradual_value = question_min_range + GRADUAL_RANGE
const GRADUAL_RANGE = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var nodes = self.get_children()
	for node in nodes:
		var enemy:Enemy = node
		var operator = generate_operator()
		var first_number = generate_number()
		var second_number = generate_number()
		if(operator == "/"):
			first_number = dividable_number(first_number,second_number)
		if(operator == "-"):
			var numbers = avoid_minus_negative_answer(first_number,second_number)
			first_number = numbers[0]
			second_number = numbers[1]
		enemy.operator = operator
		enemy.first_number = first_number
		enemy.second_number = second_number
		increase_gradual()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func increase_gradual():
	gradual_value = min(gradual_value + 1, question_max_range - GRADUAL_RANGE)

func generate_gradual_number():
	var lower_boundary = gradual_value - GRADUAL_RANGE
	var upper_boundry = gradual_value + GRADUAL_RANGE
	var number = rng.randi_range(lower_boundary, upper_boundry)
	while number < question_min_range or number > question_max_range:
		number = rng.randi_range(lower_boundary, upper_boundry)
	return number

func generate_number_normal():
	return rng.randi_range(question_min_range, question_max_range)

func generate_number():
	return generate_gradual_number() if gradual_increase else generate_number_normal()

func generate_operator():
	return theme_operator if theme_operator != null else available_operator[rng.randi_range(0,len(available_operator) - 1)]

func dividable_number(number1:int,number2:int):
	return number1 * number2

func avoid_minus_negative_answer(number1:int,number2:int):
	if(number1 - number2 < 0):
		return [number2,number1]
	return [number1,number2]
	
