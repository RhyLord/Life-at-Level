extends Control

@onready var Game_Scene = "res://Scenes/Locations/players_bedroom.tscn"

var dialogue = 0
var dialogue_text =""
var face_value = unimpressed

@onready var Dialogue_Box = $DialogueHolder
@onready var Next_Button = $DialogueHolder/Next_Button
@onready var Txt = $DialogueHolder/RichTextLabel
@onready var Bg = $Bg

#Eternos
@onready var Eternos_Music = $EternosMusic
@onready var Body = $Body

#claire
@onready var Claire_Music = $ClaireMusic
@onready var Claire_Face = $Body_Claire

#Eternos
@export var unimpressed = preload("res://Assets/NPC_Art/Eternos_Art/Eternos_Face_00_Unimpressed.png") #unimpressed
@export var normal = preload("res://Assets/NPC_Art/Eternos_Art/Eternos_Face_01_Normal.png") # normal 
@export var content = preload("res://Assets/NPC_Art/Eternos_Art/Eternos_Face_02_Content.png") #content
@export var angry = preload("res://Assets/NPC_Art/Eternos_Art/Eternos_Face_03_Angry.png")
@export var unamused = preload("res://Assets/NPC_Art/Eternos_Art/Eternos_Face_04_Unamused.png")
@export var wacky = preload("res://Assets/NPC_Art/Eternos_Art/Eternos_Face_04_Wacky.png")


#Claire
@export var very_happy = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_00_Eyes_Close_Happy.png")
@export var Happy = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_01_Eyes_Open_Happy.png")
@export var Eyebrowing = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_02_Eyes_Open_EyeBrowing.png")
@export var Uninterested = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_03_Eyes_Open_Uninterested.png")
@export var Questioning = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_04_Eyes_Open_Questioning.png")
@export var Sad = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_05_Eyes_Open_Sad.png")
@export var Open_Mouth_Happy = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_06_Eyes_Open_Mouth_Open_Happy.png")
@export var Pissed = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_07_Eyes_Pissed.png")
@export var Angry = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_08_Eyes_Angry.png")
@export var Worrying = preload("res://Assets/NPC_Art/Claire_Art/Claire_Face_09_Eyes_Open_Worrying.png")

#Bg textures
@export var Void_Bg = preload("res://Assets/Location_Art/Static/VoidBg01.png")
@export var Claire_Room = preload("res://Assets/Map_Art/ClaireRoom/ClaireBedroomMorning.png")


func _on_next_button_button_up():
	dialogue += 1
	GlobalButtonClick.button_click()
	story_progress()
	update()

func update():
	Txt.text = dialogue_text
	Body.texture = face_value



func _ready():
	dialogue = 1
	story_progress()
	update()
	
func story_progress():
	if dialogue == 1:
		Bg.texture = Void_Bg
		Eternos_Music.play()
		Bg.modulate = Color(0.15, 0.18, 0.25)
		dialogue_text = "Summoner: Wake up. I don’t have all day."
		face_value = unimpressed
	elif dialogue == 2:
		dialogue_text = "Player: What...? Where am I?"
		face_value = normal
	elif dialogue == 3:
		dialogue_text = "Summoner: Ah, finally. You’re awake."
		face_value = content
	elif dialogue == 4:
		dialogue_text = "Player: Seriously, where am I?"
		face_value = normal
	elif dialogue == 5:
		dialogue_text = "Summoner: You died. In your original world. So… I bought your soul."
		face_value = unimpressed
	elif dialogue == 6:
		dialogue_text = "Player: You bought my soul?!"
		face_value = angry
	elif dialogue == 7:
		dialogue_text = "Summoner: You don’t need to understand the details."
		face_value = unamused
	elif dialogue == 8:
		dialogue_text = "Player: Huh?"
		face_value = wacky
	elif dialogue == 9:
		dialogue_text = "Summoner: Long story short—I am Eternos, a divine being. I’m creating warriors. Strong ones."
		face_value = normal
	elif dialogue == 10:
		dialogue_text = "Player: Warriors?"
		face_value = normal
	elif dialogue == 11:
		dialogue_text = "Summoner: I’ve gifted you the potential to grow stronger. You won’t start strong... but you can become powerful. If you work for it."
		face_value = content
	elif dialogue == 12:
		dialogue_text = "Player: Why do you need strong beings?"
		face_value = normal
	elif dialogue == 13:
		dialogue_text = "Summoner: Because divine beings can’t fight mortals directly. That’s where you come in. You’ll fight my battles."
		face_value = unimpressed
	elif dialogue == 14:
		dialogue_text = "Player: So ... I have the power to grow stronger?"
		face_value = normal
	elif dialogue == 15:
		dialogue_text = "Summoner: Yes. The more you do something, the better you get. Think of it like levelling up your skills."
		face_value = content
	elif dialogue == 16:
		dialogue_text = "Player: I see."
		face_value = normal
	elif dialogue == 17:
		dialogue_text = "Summoner: Don’t think you're special. You’re not the only one I’ve chosen. Many others walk this path. If you slack off, I’ll pit one of them against you. Or you against them."
		face_value = angry
	elif dialogue == 18:
		dialogue_text = "Player: Wait—to the death?"
		face_value = angry
	elif dialogue == 19:
		dialogue_text = "Summoner: Of course. I have no use for weaklings. So, work hard... or be prepared to meet your demise."
		face_value = unimpressed
	elif dialogue == 20:
		dialogue_text = "Player: I guess I have no choice but to work hard."
		face_value = normal
	elif dialogue == 21:
		dialogue_text = "Summoner: Good. I’ve already assigned a guide for you in the new world. She’s also the owner of the house you’ll be living in. From now on, she’ll guide your journey."
		face_value = content
	elif dialogue == 22:
		dialogue_text = "Player: Wait... do I have to pay rent?"
		face_value = wacky
	elif dialogue == 23:
		dialogue_text = "Summoner: No. But you will carry out any task she assigns you."
		face_value = unimpressed
	elif dialogue == 24:
		dialogue_text = "Player: So ... like washing dishes?"
		face_value = unamused
	elif dialogue == 25:
		dialogue_text = "Summoner: Moving on. Every time you level up, you’ll receive stat allocation points. Use them wisely."
		face_value = normal
	elif dialogue == 26:
		dialogue_text = "Player: This really is like a game..."
		face_value = normal
	elif dialogue == 27:
		dialogue_text = "Summoner: You have 100 days to prepare before I send you into your first battle. Fail to prepare... and you already know what happens next."
		face_value = angry
	elif dialogue == 28:
		Claire_Face.global_position.x = 550
		Claire_Face.global_position.y = 380
		Body.global_position.x = 2000
		Body.global_position.y = 2500
		Bg.texture = Claire_Room
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Eternos_Music.stop()
		Claire_Music.play()
		dialogue_text = "Claire: You must be the new one. What’s your name?"
		Claire_Face.texture = Happy
	elif dialogue == 29:
		dialogue_text = "Player: I’m Player."
		Claire_Face.texture = Happy
	elif dialogue == 30:
		dialogue_text = "Claire: Nice to meet you. I’m Claire — your guide, and also the owner of your new home."
		Claire_Face.texture = Happy
	elif dialogue == 31:
		dialogue_text = "Player: So… what exactly am I supposed to do?"
		Claire_Face.texture = Questioning
	elif dialogue == 32:
		dialogue_text = "Claire: For now, focus on getting stronger. The two people who came before you both failed the first stage."
		Claire_Face.texture = Sad
	elif dialogue == 33:
		dialogue_text = "Claire: The first was a girl who wasted time. She died on day 164 after Eternos sent someone to hunt her down."
		Claire_Face.texture = Worrying
	elif dialogue == 34:
		dialogue_text = "Claire: The second was a man who rushed things. He learned fire magic by day 9, ran straight to Eternos, and got himself killed in the challenge."
		Claire_Face.texture = Angry
	elif dialogue == 35:
		dialogue_text = "Player: So, I can’t slack off… or be reckless."
		Claire_Face.texture = Questioning
	elif dialogue == 36:
		dialogue_text = "Claire: Exactly. You can attempt Eternos' challenge anytime at the Temple of Time."
		Claire_Face.texture = Eyebrowing
	elif dialogue == 37:
		dialogue_text = "Claire: But don’t wait past day 100. He might make your opponent stronger… and if you wait too long, he’ll send someone to eliminate you."
		Claire_Face.texture = Uninterested
	elif dialogue == 38:
		dialogue_text = "Player: Can you tell me more about my situation?"
		Claire_Face.texture = Questioning
	elif dialogue == 39:
		dialogue_text = "Claire: Eternos is a divine being. Why he creates warriors… even I don’t fully know."
		Claire_Face.texture = Worrying
	elif dialogue == 40:
		dialogue_text = "Claire: He says it’s to fight his battles, but that’s all I’ve ever been told."
		Claire_Face.texture = Sad
	elif dialogue == 41:
		dialogue_text = "Claire: The Temple of Time is where his devotees worship him. In this world, Eternos is treated like a god — and each world is allowed only one chosen warrior at a time."
		Claire_Face.texture = Eyebrowing
	elif dialogue == 42:
		dialogue_text = "Player: So, I’m the chosen warrior here?"
		Claire_Face.texture = Questioning
	elif dialogue == 43:
		dialogue_text = "Claire: Yes. But remember, other worlds have their own chosen too."
		Claire_Face.texture = Open_Mouth_Happy
	elif dialogue == 44:
		dialogue_text = "Claire: As for the temple’s devotees… they’re unpredictable. It’s best not to interact with them too much."
		Claire_Face.texture = Worrying
	elif dialogue == 45:
		dialogue_text = "Player: Unpredictable how?"
		Claire_Face.texture = Questioning
	elif dialogue == 46:
		dialogue_text = "Claire: Some might try to worship you. Others might see you as a sacrifice."
		Claire_Face.texture = Uninterested
	elif dialogue == 47:
		dialogue_text = "Player: So basically… they’re lunatics."
		Claire_Face.texture = Eyebrowing
	elif dialogue == 48:
		dialogue_text = "Claire: Kind of. Some are polite, calm, and respectful."
		Claire_Face.texture = Sad
	elif dialogue == 49:
		dialogue_text = "Claire: And some… are just completely crazy."
		Claire_Face.texture = Angry
	elif dialogue == 50:
		dialogue_text = "Player: Can you tell me about my powers?"
		Claire_Face.texture = Questioning
	elif dialogue == 51:
		dialogue_text = "Claire: You have the ability to grow stronger over time — everything you do can become a skill."
		Claire_Face.texture = Happy
	elif dialogue == 52:
		dialogue_text = "Claire: For example, if you keep doing push-ups, that action becomes a registered skill. The more you train it, the stronger it gets… and so do you."
		Claire_Face.texture = very_happy
	elif dialogue == 53:
		dialogue_text = "Claire: You’ll also level up as a whole. Every time you do, you’ll receive 10 stat allocation points. You can use those to improve your attributes."
		Claire_Face.texture = Open_Mouth_Happy
	elif dialogue == 54:
		dialogue_text = "Player: So, I can choose how I grow?"
		Claire_Face.texture = Questioning
	elif dialogue == 55:
		dialogue_text = "Claire: Exactly. Raise your Strength high enough, and you might unlock new physical skills. Do the same with Intelligence or Agility — each stat opens new paths depending on how far you push it."
		Claire_Face.texture = Happy
	elif dialogue == 56:
		dialogue_text = "Player: Now tell me about this house."
		Claire_Face.texture = Questioning
	elif dialogue == 57:
		dialogue_text = "Claire: Well, I’m the owner. Right now, it’s a bit… minimal. I haven’t had the time — or money — to build or furnish any new rooms. But if you help me gather the funds, we can expand and upgrade the place together."
		Claire_Face.texture = Uninterested
	elif dialogue == 58:
		dialogue_text = "Player: What rooms are available right now?"
		Claire_Face.texture = Questioning
	elif dialogue == 59:
		dialogue_text = "Claire: Your bedroom, my bedroom, the bathroom… and a small garden out back."
		Claire_Face.texture = Happy
	elif dialogue == 60:
		dialogue_text = "Player: No kitchen?"
		Claire_Face.texture = Eyebrowing
	elif dialogue == 61:
		dialogue_text = "Claire: Not yet. If you bring in enough money, we can build one. I usually eat at work anyway — I work at the local tavern."
		Claire_Face.texture = Open_Mouth_Happy
	elif dialogue == 62:
		dialogue_text = "Claire: You could work there too, but with your current stats? Yeah… you’re not exactly worth hiring just yet. I’d suggest raising your stats first."
		Claire_Face.texture = Pissed
	elif dialogue == 63:
		dialogue_text = "Player: Any suggestions for me?"
		Claire_Face.texture = Questioning
	elif dialogue == 64:
		dialogue_text = "Claire: Take on Eternos’ challenge after day 90, but before day 100. That’s your best window."
		Claire_Face.texture = very_happy
	elif dialogue == 65:
		dialogue_text = "Claire: Create a few slime dungeons and grind there to level up your stats. You’ll need the strength."
		Claire_Face.texture = Happy
	elif dialogue == 66:
		dialogue_text = "Claire: You can also look for small jobs around town — Rabonia. It’s part of the Kingdom of Coxanne."
		Claire_Face.texture = very_happy
	elif dialogue == 67:
		dialogue_text = "Claire: Just… don’t stir up trouble. The guards here aren’t exactly known for their patience."
		Claire_Face.texture = Worrying
	elif dialogue == 68:
		Player.New_Game()
		get_tree().change_scene_to_file(Game_Scene)






