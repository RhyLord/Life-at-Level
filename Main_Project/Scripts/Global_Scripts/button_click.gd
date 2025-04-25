extends AudioStreamPlayer2D

@onready var sound = $"."

func button_click():
	sound.play()
