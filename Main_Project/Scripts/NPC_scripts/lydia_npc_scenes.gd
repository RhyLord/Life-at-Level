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
@onready var Lydia_Music = $LydiaMusic

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
	if Global.lydia == 2:
		dialogue = 15
	if Global.lydia == 3:
		dialogue = 35
	if Global.lydia == 4:
		dialogue = 50
	
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
		Lydia_Music.play()
		dialogue_text = "Lydia: Well, well. Fresh face. You new around here?"
		Lydia_Face.texture = Smile
	elif dialogue == 2:
		dialogue_text = "Player: Yeah, just arrived."
		Lydia_Face.texture = Normal
	elif dialogue == 3:
		dialogue_text = "Lydia: Let me guess—looking for potions?"
		Lydia_Face.texture = Smile
	elif dialogue == 4:
		dialogue_text = "Player: Actually, [color=hotpink]Claire[/color] send me. Said you'd have something for her."
		Lydia_Face.texture = Normal
	elif dialogue == 5:
		dialogue_text = "Lydia: Claire, huh? So you're the latest chosen one."
		Lydia_Face.texture = Speaking
	elif dialogue == 6:
		dialogue_text = "Player: You mean the warrior anointed by [color=lightblue]Eternos[/color]?"
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
		dialogue_text = "Player: Anyway… [color=hotpink]Claire[/color] mentioned a package?"
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
	
	elif dialogue == 15:
		Lydia_Face.global_position.x = 550
		Lydia_Face.global_position.y = 380
		Lydia_Music.play()
		dialogue_text = "Player: Hey Lydia! What are you doing? Making soup?"
		Lydia_Face.texture = Normal
	elif dialogue == 16:
		dialogue_text = "Lydia: …It’s a mana infusion. For stabilizing arcane flow."
		Lydia_Face.texture = Frustrated
	elif dialogue == 17:
		dialogue_text = "Player: Oh. So like… spicy soup for magic?"
		Lydia_Face.texture = Frustrated
	elif dialogue == 18:
		dialogue_text = "Lydia: Sure. Let’s go with that."
		Lydia_Face.texture = Normal
	elif dialogue == 19:
		dialogue_text = "Player: Neat! I bet I’d be good at this stuff if I tried. I once made tea. Boiled the bag and everything."
		Lydia_Face.texture = Normal
	elif dialogue == 20:
		dialogue_text = "Lydia: Fascinating."
		Lydia_Face.texture = Speaking
	elif dialogue == 21:
		dialogue_text = "Player: Sooo… you wanna hang out or something? I got, like, all day."
		Lydia_Face.texture = Frustrated
	elif dialogue == 22:
		dialogue_text = "Lydia: I… really don’t."
		Lydia_Face.texture = Normal
	elif dialogue == 23:
		dialogue_text = "Player: Cool cool. I can just watch. Maybe learn the soup spell."
		Lydia_Face.texture = Normal
	elif dialogue == 24:
		dialogue_text = "Lydia: Please don’t touch anything."
		Lydia_Face.texture = Normal
	elif dialogue == 25:
		dialogue_text = "Player: What’s that blue stuff? Can I drink it?"
		Lydia_Face.texture = Smile
	elif dialogue == 26:
		dialogue_text = "Lydia: Only if you enjoy temporary blindness and mild combustion."
		Lydia_Face.texture = EyesCloseSmile
	elif dialogue == 27:
		dialogue_text = "Player: Oh. Haha. Good joke."
		Lydia_Face.texture = Smile
	elif dialogue == 28:
		dialogue_text = "Lydia: It wasn’t."
		Lydia_Face.texture = EyesCloseSmile
	elif dialogue == 29:
		dialogue_text = "Player: You're funny, Lydia. We should hang out more."
		Lydia_Face.texture = Smile
	elif dialogue == 30:
		dialogue_text = "Lydia: We shouldn’t."
		Lydia_Face.texture = Normal
	elif dialogue == 31:
		Global.lydia = 1
		get_tree().change_scene_to_file(Game_Scene)
		
	elif dialogue == 35:
		Lydia_Face.global_position.x = 550
		Lydia_Face.global_position.y = 380
		Lydia_Music.play()
		dialogue_text = "Player: Hey."
		Lydia_Face.texture = Normal
	elif dialogue == 36:
		dialogue_text = "Lydia: Hi."
		Lydia_Face.texture = Normal

	elif dialogue == 37:
		dialogue_text = "Player: So uh… are you made of mana? ’Cause you’ve got me enchanted."
		Lydia_Face.texture = Frustrated

	elif dialogue == 38:
		dialogue_text = "Lydia: That was terrible."
		Lydia_Face.texture = Frustrated

	elif dialogue == 39:
		dialogue_text = "Player: Haha… but like, in a charming way, right?"
		Lydia_Face.texture = Normal

	elif dialogue == 40:
		dialogue_text = "Lydia: No."
		Lydia_Face.texture = Normal

	elif dialogue == 41:
		dialogue_text = "Player: I could be your potion… you know, like a love potion. Heh."
		Lydia_Face.texture = Frustrated

	elif dialogue == 42:
		dialogue_text = "Lydia: I'd rather drink expired frog bile."
		Lydia_Face.texture = Frustrated

	elif dialogue == 43:
		dialogue_text = "Player: Ouch. You’re really good at this hard-to-get thing."
		Lydia_Face.texture = Normal

	elif dialogue == 44:
		dialogue_text = "Lydia: I’m not playing hard to get. I just want you to leave."
		Lydia_Face.texture = Frustrated

	elif dialogue == 45:
		dialogue_text = "Player: Well, if you change your mind—"
		Lydia_Face.texture = Normal

	elif dialogue == 46:
		dialogue_text = "Lydia: I won’t."
		Lydia_Face.texture = Normal
	elif dialogue == 47:
		Global.lydia = 1
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 50:
		Lydia_Face.global_position.x = 550
		Lydia_Face.global_position.y = 380
		Lydia_Music.play()
		dialogue_text = "Player: Hey Lydia, wanna hear a joke?"
		Lydia_Face.texture = Normal
	elif dialogue == 51:
		dialogue_text = "Lydia: Not really."
		Lydia_Face.texture = Frustrated

	elif dialogue == 52:
		dialogue_text = "Player: Why did the wizard bring a ladder to the magic class?"
		Lydia_Face.texture = Normal

	elif dialogue == 53:
		dialogue_text = "Lydia: I don’t know. Why?"
		Lydia_Face.texture = Speaking

	elif dialogue == 54:
		dialogue_text = "Player: Because he wanted to reach the high spells!"
		Lydia_Face.texture = Normal

	elif dialogue == 55:
		dialogue_text = "Lydia: That was awful."
		Lydia_Face.texture = Frustrated

	elif dialogue == 56:
		dialogue_text = "Player: Aw, come on! It was magical!"
		Lydia_Face.texture = Smile

	elif dialogue == 57:
		dialogue_text = "Lydia: The only thing magical is how quickly I’m losing patience."
		Lydia_Face.texture = Frustrated

	elif dialogue == 58:
		dialogue_text = "Player: Haha, you’re funny, Lydia!"
		Lydia_Face.texture = Smile

	elif dialogue == 59:
		dialogue_text = "Lydia: Leave."
		Lydia_Face.texture = Frustrated
	elif dialogue == 60:
		Global.lydia = 1
		get_tree().change_scene_to_file(Game_Scene)
	
