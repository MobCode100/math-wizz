extends Button

var hovered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".custom_minimum_size = $".".size
	$RichTextLabel.text = "[center]" + $".".text + "[/center]"
	$".".text = ""
	if ($".".icon):
		# 64.0/122.0 is the icon width percentage
		$"RichTextLabel".add_image($".".icon,$".".size.x * (64.0/122.0))
		$".".icon = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_down() -> void:
	print($RichTextLabel.position.y)
	$RichTextLabel.position.y += 3
	return

func _on_button_up() -> void:
	if(hovered):
		$RichTextLabel.position.y -= 3
	return

func _on_mouse_entered() -> void:
	if(button_pressed):
		$RichTextLabel.position.y += 3
	$RichTextLabel.position.y += 1
	hovered = true
	return

func _on_mouse_exited() -> void:
	if(button_pressed):
		$RichTextLabel.position.y -= 3
	$RichTextLabel.position.y -= 1
	hovered = false
	return
