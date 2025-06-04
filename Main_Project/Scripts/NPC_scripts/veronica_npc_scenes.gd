extends Control

@onready var Game_Scene = "res://Scenes/Locations/soldier_barracks.tscn"

@onready var Bg_Holder = $Bg

@export var Smile = preload("res://Assets/NPC_Art/Veronica_Art/Veronica_Face_00_Smile.png")
@export var Smirk = preload("res://Assets/NPC_Art/Veronica_Art/Veronica_Face_01_Smirk.png")
@export var Normal = preload("res://Assets/NPC_Art/Veronica_Art/Veronica_Face_02_Normal.png")
@export var Pissed = preload("res://Assets/NPC_Art/Veronica_Art/Veronica_Face_03_Pissed.png")
@export var Happy = preload("res://Assets/NPC_Art/Veronica_Art/Veronica_Face_04_Happy.png")

var bg_textures = [
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Morning.png"),
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Noon.png"),
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Evening.png"),
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Night.png"),
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Midnight.png")
]

@onready var Veronica_Face = $Body_Veronica

@onready var Dialogue_Box = $DialogueHolder
@onready var Next_Button = $DialogueHolder/Next_Button
@onready var Txt = $DialogueHolder/RichTextLabel
@onready var Veronica_Music = $VeronicaMusic


func Set_Core_Stats():
	Bg_Holder.texture = bg_textures[Global.Time_of_day]

func update():
	Txt.text = dialogue_text

var dialogue = 0
var dialogue_text =""

func _on_next_button_button_up():
	dialogue += 1
	GlobalButtonClick.button_click()
	story_progress()
	update()

func check_story():
	if Global.veronica == 2:
		dialogue = 25
	if Global.veronica == 3:
		dialogue = 45
	if Global.veronica == 4:
		dialogue = 65

	if Global.veronica == 0:
		if Global.claire_quest == 1 and Global.claire_sub_quest == 2:
			dialogue = 1
	
	if Global.veronica == 1:
		if Global.claire_quest == 1 and Global.claire_sub_quest == 3:
			dialogue = 20

func _ready():
	Set_Core_Stats()
	check_story()
	story_progress()
	update()

func story_progress():
	if dialogue == 1:
		Veronica_Face.global_position.x = 550
		Veronica_Face.global_position.y = 380
		Veronica_Music.play()
		dialogue_text = "Player: Hello, [color=lightblue]Veronica[/color]."
		Veronica_Face.texture = Normal
	elif dialogue == 2:
		dialogue_text = "Veronica: Am I supposed to know you?"
		Veronica_Face.texture = Smile
	elif dialogue == 3:
		dialogue_text = "Player: [color=hotpink]Claire[/color] sent me."

	elif dialogue == 4:
		dialogue_text = "Veronica: Ah, so you're the new candidate."
		Veronica_Face.texture = Normal

	elif dialogue == 5:
		dialogue_text = "Player: Yeah. [color=hotpink]Claire[/color] said you had a starter weapon for me."

	elif dialogue == 6:
		dialogue_text = "Veronica: No."
		Veronica_Face.texture = Smirk

	elif dialogue == 7:
		dialogue_text = "Player: What?!"

	elif dialogue == 8:
		dialogue_text = "Veronica: Why should I just hand one over?"
		Veronica_Face.texture = Pissed

	elif dialogue == 9:
		dialogue_text = "Veronica: The last person I gave a weapon to barely used it before getting wiped."

	elif dialogue == 10:
		dialogue_text = "Player: I’m different."

	elif dialogue == 11:
		dialogue_text = "Veronica: That’s what they all say."
		Veronica_Face.texture = Smirk

	elif dialogue == 12:
		dialogue_text = "Player: At least give me a chance."

	elif dialogue == 13:
		dialogue_text = "Veronica: Fine. Bring me [color=green]10 green slimeballs[/color], and then we'll talk."
		Veronica_Face.texture = Smile

	elif dialogue == 14:
		dialogue_text = "Player: How am I supposed to fight them without a weapon?"

	elif dialogue == 15:
		dialogue_text = "Veronica: You’ve got two hands. Figure it out. Not my problem."
		Veronica_Face.texture = Smirk
	elif dialogue == 16:
		Global.claire_sub_quest = 3
		Global.veronica = 1
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 20:
		Veronica_Face.global_position.x = 550
		Veronica_Face.global_position.y = 380
		Veronica_Music.play()
		dialogue_text = "Veronica: Did you bring the [color=green]10 green slimeballs[/color]?"
		Veronica_Face.texture = Normal
	elif dialogue == 21:
		dialogue_text = "Player: No"
		Veronica_Face.texture = Smirk
	elif dialogue == 22:
		dialogue_text = "Veronica: Then no starter weapon for you."
		Veronica_Face.texture = Smirk
	elif dialogue == 23:
		Global.veronica = 1
		get_tree().change_scene_to_file(Game_Scene)
		
	elif dialogue == 25:
		Veronica_Face.global_position.x = 550
		Veronica_Face.global_position.y = 380
		Veronica_Music.play()
		dialogue_text = "Player: Hey, [color=lightblue]Veronica[/color]."
		Veronica_Face.texture = Normal
	elif dialogue == 26:
		dialogue_text = "Veronica: Address me properly."
		Veronica_Face.texture = Smirk

	elif dialogue == 27:
		dialogue_text = "Player: Sorry—Commander [color=lightblue]Veronica[/color]."

	elif dialogue == 28:
		dialogue_text = "Veronica: Hmph. Good. Discipline is the backbone of survival."
		Veronica_Face.texture = Normal

	elif dialogue == 29:
		dialogue_text = "Player: Do you ever take a break? You’re always so focused."

	elif dialogue == 30:
		dialogue_text = "Veronica: Breaks are for those who can afford failure. I don’t have that luxury."
		Veronica_Face.texture = Pissed

	elif dialogue == 31:
		dialogue_text = "Player: Still… it’s kinda impressive. You hold everything together."

	elif dialogue == 32:
		dialogue_text = "Veronica: I hold it together because if I don’t—no one else will."

	elif dialogue == 33:
		dialogue_text = "Player: That’s a lot of pressure."

	elif dialogue == 34:
		dialogue_text = "Veronica: I was trained for pressure. Unlike most of you."
		Veronica_Face.texture = Smirk

	elif dialogue == 35:
		dialogue_text = "Player: Ouch. That was harsh."

	elif dialogue == 36:
		dialogue_text = "Veronica: Truth isn’t always gentle. But... I suppose you’ve been proving yourself."
		Veronica_Face.texture = Normal

	elif dialogue == 37:
		dialogue_text = "Player: Wait—was that a compliment?"

	elif dialogue == 38:
		dialogue_text = "Veronica: Don’t push it."
		Veronica_Face.texture = Pissed

	elif dialogue == 39:
		dialogue_text = "Player: Yes, ma’am."

	elif dialogue == 40:
		dialogue_text = "Veronica: Hmph. At ease, then."
		Veronica_Face.texture = Smile
	
	elif dialogue == 41:
		Global.veronica = 1
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 45:
		Veronica_Face.global_position.x = 550
		Veronica_Face.global_position.y = 380
		Veronica_Music.play()
		dialogue_text = "Player: So… Commander [color=lightblue]Veronica[/color], do all army commanders look this good, or is it just you?"
		Veronica_Face.texture = Normal
	elif dialogue == 46:
		dialogue_text = "Veronica: ...You’re not serious."
		Veronica_Face.texture = Pissed

	elif dialogue == 47:
		dialogue_text = "Player: Dead serious. I mean, if looks could kill, you wouldn’t even need a sword."

	elif dialogue == 48:
		dialogue_text = "Veronica: I do have a sword. And a spear. And I know how to use both."
		Veronica_Face.texture = Smirk

	elif dialogue == 49:
		dialogue_text = "Player: Dangerous and beautiful. That’s kind of my type, honestly."

	elif dialogue == 50:
		dialogue_text = "Veronica: Is embarrassing yourself your type too?"
		Veronica_Face.texture = Normal

	elif dialogue == 51:
		dialogue_text = "Player: Only if it gets a smile out of you."

	elif dialogue == 52:
		dialogue_text = "Veronica: You’re mistaking my restraint for amusement. Keep talking, and I’ll have you running laps until sunrise."
		Veronica_Face.texture = Pissed

	elif dialogue == 53:
		dialogue_text = "Player: Is that… your way of asking me on a date?"

	elif dialogue == 54:
		dialogue_text = "Veronica: That’s my way of saying shut up and go train."

	elif dialogue == 55:
		dialogue_text = "Player: Cold… but mysterious. I can work with that."

	elif dialogue == 56:
		dialogue_text = "Veronica: One more word, and I’ll file you under “missing in action.”"
		Veronica_Face.texture = Smirk

	elif dialogue == 57:
		dialogue_text = "Player: …Right. Training. Got it."

	elif dialogue == 58:
		dialogue_text = "Veronica: Finally."
		Veronica_Face.texture = Normal
	elif dialogue == 59:
		Global.veronica = 1
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 65:
		Veronica_Face.global_position.x = 550
		Veronica_Face.global_position.y = 380
		Veronica_Music.play()
		dialogue_text = "Player: Hey [color=lightblue]Veronica[/color], what do you call a soldier who’s afraid of battle?"
		Veronica_Face.texture = Normal
	elif dialogue == 66:
		dialogue_text = "Veronica: …No."
		Veronica_Face.texture = Pissed

	elif dialogue == 67:
		dialogue_text = "Player: A chick-en general! Get it? 'Cause—like, a chicken?"

	elif dialogue == 68:
		dialogue_text = "Veronica: …"
		Veronica_Face.texture = Normal

	elif dialogue == 69:
		dialogue_text = "Player: You’re not laughing."

	elif dialogue == 70:
		dialogue_text = "Veronica: That’s because I’m actively trying to forget what I just heard."

	elif dialogue == 71:
		dialogue_text = "Player: But come on, that was gold."

	elif dialogue == 72:
		dialogue_text = "Veronica: That was a disgrace to both comedy and military rank."
		Veronica_Face.texture = Pissed

	elif dialogue == 73:
		dialogue_text = "Player: You’re just mad you didn’t come up with it."

	elif dialogue == 74:
		dialogue_text = "Veronica: I command an entire army. I don’t have time for poultry puns."

	elif dialogue == 75:
		dialogue_text = "Player: I guess you could say… you’re not egg-sactly impressed."

	elif dialogue == 76:
		dialogue_text = "Veronica: Leave."
		Veronica_Face.texture = Smirk

	elif dialogue == 77:
		dialogue_text = "Player: Wait—seriously?"

	elif dialogue == 78:
		dialogue_text = "Veronica: Out of my sight, before I make you roasted chicken."
		Veronica_Face.texture = Pissed
	elif dialogue == 79:
		Global.veronica = 1
		get_tree().change_scene_to_file(Game_Scene)



