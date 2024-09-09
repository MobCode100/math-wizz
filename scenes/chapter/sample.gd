extends Node2D

signal new_enemy()
@export var enemy:Node:
	get: 
		return enemy
	set(value):
		enemy = value
		emit_signal("new_enemy")

@export var option_list:Array[Node]
@export var question_label:Label
@export var question_ui:Node2D
@export var player:CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_enemy() -> void:
	if(enemy == null): enemy_gone()
	else: enemy_appear()

func enemy_gone():
	hide_question()
	print("enemy null")

func enemy_appear():
	show_question()
	update_options()
	update_question()

func _on_confirm_pressed() -> void:
	var correct = enemy.isAnswerCorrect(player.selected_answer)
	if(correct):
		question_label.text = "correct"
		enemy.die()

func update_question():
	question_label.text = enemy.question

func hide_question():
	question_ui.visible = false
	
func show_question():
	question_ui.visible = true

func update_options():
		for i in range(0,max(len(option_list),4)):
			option_list[i].answer = str(enemy.generatedOptions[i]) 
