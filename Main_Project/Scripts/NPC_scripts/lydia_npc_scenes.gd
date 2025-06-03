extends Control


@onready var Game_Scene = "res://Scenes/Shop/lydia_potion_shop.tscn"

#Lydia
@export var Normal = preload("res://Assets/NPC_Art/Lydia_Art/Lydia_Face_00_Normal.png")
@export var Smile = preload("res://Assets/NPC_Art/Lydia_Art/Lydia_Face_01_Smile.png")
@export var Speaking = preload("res://Assets/NPC_Art/Lydia_Art/Lydia_Face_02_Speaking.png")
@export var EyesCloseSmile = preload("res://Assets/NPC_Art/Lydia_Art/Lydia_Face_03_EyesClose_Smile.png")
@export var Frustrated = preload("res://Assets/NPC_Art/Lydia_Art/Lydia_Face_04_Frustrated.png")


@onready var Lydia_Face = $Body_Lydia

@onready var Dialogue_Box = $DialogueHolder
@onready var Next_Button = $DialogueHolder/Next_Button
@onready var Txt = $DialogueHolder/RichTextLabel

var dialogue = 0
var dialogue_text =""

func _on_next_button_button_up():
	dialogue += 1
	GlobalButtonClick.button_click()
	story_progress()
	update()

func update():
	Txt.text = dialogue_text

func check_story():
	if Global.lydia == 0:
		if Global.claire_quest == 1 and Global.claire_sub_quest == 0:
			dialogue = 1

func _ready():
	check_story()
	story_progress()
	update()

func story_progress():
	if dialogue == 1:
		Lydia_Face.global_position.x = 550
		Lydia_Face.global_position.y = 380
		dialogue_text = "Lydia: Well, well. Fresh face. You new around here?"
		Lydia_Face.texture = Smile
	elif dialogue == 2:
		dialogue_text = "Player: Yeah, just arrived."
		Lydia_Face.texture = Normal
	elif dialogue == 3:
		dialogue_text = "Lydia: Let me guess—looking for potions?"
		Lydia_Face.texture = Smile
	elif dialogue == 4:
		dialogue_text = "Player: Actually, Claire send me. Said you'd have something for her."
		Lydia_Face.texture = Normal
	elif dialogue == 5:
		dialogue_text = "Lydia: Claire, huh? So you're the latest chosen one."
		Lydia_Face.texture = Speaking
	elif dialogue == 6:
		dialogue_text = "Player: You mean the warrior anointed by Eternos?"
		Lydia_Face.texture = EyesCloseSmile
	elif dialogue == 7:
		dialogue_text = "Lydia: Call it what you want. I’ve seen plenty of “warriors” come through here. None lasted long."
		Lydia_Face.texture = Smile
	elif dialogue == 8:
		dialogue_text = "Player: I just got here. Bit early to judge, don’t you think?"
		Lydia_Face.texture = Smile
	elif dialogue == 9:
		dialogue_text = "Lydia: Exactly why I’m not holding my breath."
		Lydia_Face.texture = EyesCloseSmile
	elif dialogue == 10:
		dialogue_text = "Player: Anyway… Claire mentioned a package?"
		Lydia_Face.texture = Normal
	elif dialogue == 11:
		dialogue_text = "Lydia: Right, the delivery. Here you go, errand boy. Try not to drop it on your way back."
		Lydia_Face.texture = EyesCloseSmile
	elif dialogue == 12:
		dialogue_text = "Player: Thanks. I’ll manage."
		Lydia_Face.texture = Smile
	elif dialogue == 13:
		Global.claire_sub_quest = 1
		Global.lydia = 1
		get_tree().change_scene_to_file(Game_Scene)
