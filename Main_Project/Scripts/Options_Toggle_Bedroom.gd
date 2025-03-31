extends Button

@onready var options_bg = $"../Options_holder"
@onready var Toggle = $"."
var toggle_value = true

func _on_button_up():
	toggle_value = !toggle_value  # Toggle the value

	Toggle.text = "<" if toggle_value else ">"
	Toggle.position.x = 200 if toggle_value else 0
	options_bg.position.x = 0 if toggle_value else -200
