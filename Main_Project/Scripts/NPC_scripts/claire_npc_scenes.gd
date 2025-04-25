extends Control

@onready var Game_Scene = "res://Scenes/Locations/claires_room.tscn"

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


#claire
@onready var Claire_Music = $ClaireMusic
@onready var Claire = $Body_Claire
@onready var Claire_Face = $Body_Claire/Face_Claire

@onready var Dialogue_Box = $DialogueHolder
@onready var Next_Button = $DialogueHolder/Next_Button
@onready var Txt = $DialogueHolder/RichTextLabel
@onready var Bg = $Bg

var dialogue = 0
var dialogue_text =""

func _on_next_button_button_up():
	dialogue += 1
	GlobalButtonClick.button_click()
	story_progress()
	update()

func update():
	Txt.text = dialogue_text

func _ready():
	check_story()
	story_progress()
	update()

func check_story():
	#Normal
	if Global.claire == 1:
		dialogue = 1
	elif Global.claire == 2:
		dialogue = 50
	elif Global.claire == 3:
		dialogue = 100
	elif Global.claire == 4:
		dialogue = 150
	elif Global.claire == 5:
		dialogue = 200
	elif Global.claire == 6:
		dialogue = 230
		
	#Claire Quest
	elif Global.claire == 7 and Global.claire_quest == 0: #Quest 1-1 Global.claire_quest should be set to 1
		dialogue = 250
	elif Global.claire == 7 and Global.claire_quest == 1: #Quest 1-1 Global.claire_quest should be set to 1
		dialogue = 300

func story_progress():
	if dialogue == 1:
		Claire.global_position.x = 550
		Claire.global_position.y = 380
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Claire_Music.play()
		dialogue_text = "Player: Can you explain how stats work?"
		Claire_Face.texture = Happy
	elif dialogue == 2:
		dialogue_text = "Claire: Of course. There are six primary stats... and four additional ones."
		Claire_Face.texture = very_happy
	elif dialogue == 3:
		dialogue_text = "Player: Alright. Let’s start with the primary."
		Claire_Face.texture = Uninterested

	elif dialogue == 4:
		dialogue_text = "Claire: Sure. First up—STR. That’s Strength. It boosts your physical power—like punching harder, lifting more."
		Claire_Face.texture = Happy

	elif dialogue == 5:
		dialogue_text = "Claire: Then there’s DEX—Dexterity. It’s about control and precision. Think accuracy, finesse, and aiming."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 6:
		dialogue_text = "Claire: VIT is Vitality. It governs your health and toughness. More VIT, more hits you can take."
		Claire_Face.texture = very_happy

	elif dialogue == 7:
		dialogue_text = "Claire: END stands for Endurance. That’s your energy pool—do more, last longer."
		Claire_Face.texture = Happy

	elif dialogue == 8:
		dialogue_text = "Claire: INT is Intelligence. It influences your magical abilities and how smart you are with spells."
		Claire_Face.texture = Eyebrowing

	elif dialogue == 9:
		dialogue_text = "Claire: And finally, AGI—Agility. It’s all about speed. Moving, dodging, striking faster."
		Claire_Face.texture = very_happy

	elif dialogue == 10:
		dialogue_text = "Player: Got it. What about the other four?"
		Claire_Face.texture = Questioning
	elif dialogue == 11:
		dialogue_text = "Claire: Those are more... specialized. But still important."
		Claire_Face.texture = Eyebrowing

	elif dialogue == 12:
		dialogue_text = "Claire: LUK is Luck. It helps with rare item drops and chance-based events."
		Claire_Face.texture = Questioning

	elif dialogue == 13:
		dialogue_text = "Claire: WIS—Wisdom. That affects your mana and how deep your magical understanding runs."
		Claire_Face.texture = very_happy

	elif dialogue == 14:
		dialogue_text = "Claire: CHA is Charisma. It boosts your social interactions—talking, convincing, charming."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 15:
		dialogue_text = "Claire: And lastly, CTRL—Control. That one affects how well you manage things like summons, constructs... advanced magic too."
		Claire_Face.texture = Eyebrowing

	elif dialogue == 16:
		dialogue_text = "Player: Sounds like there’s a lot of ways to grow."
		Claire_Face.texture = Uninterested

	elif dialogue == 17:
		dialogue_text = "Claire: Exactly. It’s not just about getting stronger. It’s about how you choose to grow."
		Claire_Face.texture = very_happy
	elif dialogue == 18:
		dialogue_text = "Player: Can you explain how Health, Mana, and Energy work?"
		Claire_Face.texture = Questioning

	elif dialogue == 19:
		dialogue_text = "Claire: Sure. Let’s start with Health—it's the red bar, also called HP. If it drops to zero... you’re done. Game over."
		Claire_Face.texture = Sad

	elif dialogue == 20:
		dialogue_text = "Claire: Then there’s Mana—the blue bar, or MP. You’ll need that for casting spells and using magic."
		Claire_Face.texture = very_happy

	elif dialogue == 21:
		dialogue_text = "Claire: And finally, Energy. It’s the purple bar, noted as EN. Think of it like stamina—you spend it on physical actions."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 22:
		dialogue_text = "Player: So… if I run out of Energy?"
		Claire_Face.texture = Uninterested

	elif dialogue == 23:
		dialogue_text = "Claire: You’ll be sluggish and useless. Resting or sleeping is the best way to recover it."
		Claire_Face.texture = Pissed
	elif dialogue == 24:
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 50:
		Claire.global_position.x = 550
		Claire.global_position.y = 380
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Claire_Music.play()
		dialogue_text = "Player: Can you explain how combat works?"
		Claire_Face.texture = Happy
	elif dialogue == 51:
		dialogue_text = "Claire: Sure. First rule? Never go into a fight tired. Make sure you’re well-rested, healed, and not low on mana."
		Claire_Face.texture = Worrying

	elif dialogue == 52:
		dialogue_text = "Claire: In combat, you and your enemies take turns. It’s turn-based—so think before you act."
		Claire_Face.texture = Eyebrowing

	elif dialogue == 53:
		dialogue_text = "Claire: Fewer enemies mean fewer incoming attacks. Always try to isolate your targets."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 54:
		dialogue_text = "Claire: Once a fight starts, there’s no running. No one’s going to let you walk away after throwing the first punch."
		Claire_Face.texture = Pissed

	elif dialogue == 55:
		dialogue_text = "Claire: Winning battles gives you XP, which helps you level up."
		Claire_Face.texture = very_happy

	elif dialogue == 56:
		dialogue_text = "Claire: And each time you level, you get 10 stat allocation points. Use them wisely—they define who you are."
		Claire_Face.texture = Questioning

	elif dialogue == 57:
		dialogue_text = "Claire: Oh, and stock up on potions. Healing, mana, energy—get what you can. They might just save your life."
		Claire_Face.texture = Sad

	elif dialogue == 58:
		dialogue_text = "Claire: And don’t forget weapons and armor. Fighting bare-handed might sound cool, but it won’t get you far."
		Claire_Face.texture = Uninterested

	elif dialogue == 59:
		dialogue_text = "Claire: A good blade or staff can make all the difference. And armor? It’s the only thing standing between you and a painful defeat."
		Claire_Face.texture = Angry
	elif dialogue == 60:
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 100:
		Claire.global_position.x = 550
		Claire.global_position.y = 380
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Claire_Music.play()
		dialogue_text = "Player: Can you tell me about yourself?"
		Claire_Face.texture = Happy
	elif dialogue == 101:
		dialogue_text = "Claire: Of course. Let me start with my schedule."
		Claire_Face.texture = very_happy
	elif dialogue == 102:
		dialogue_text = "Claire: I usually work at the tavern around noon and in the evenings."
		Claire_Face.texture = Happy

	elif dialogue == 103:
		dialogue_text = "Claire: In the mornings and at night, I’m in my room—so if you ever need to talk or ask something, that’s the best time."
		Claire_Face.texture = Happy

	elif dialogue == 104:
		dialogue_text = "Claire: Just... maybe don’t show up at midnight. The doors will be locked, and I’ll be fast asleep by then."
		Claire_Face.texture = very_happy

	elif dialogue == 105:
		dialogue_text = "Claire: I’m not originally from this world, you know."
		Claire_Face.texture = Uninterested

	elif dialogue == 106:
		dialogue_text = "Claire: Like you, my soul was brought here by Eternos after I passed away in my old world."
		Claire_Face.texture = Sad

	elif dialogue == 107:
		dialogue_text = "Claire: But my role here is different. I don’t need to fight or grow stronger like you do."
		Claire_Face.texture = Eyebrowing

	elif dialogue == 108:
		dialogue_text = "Claire: My job is to help guide souls like yours—to make sure you’re on the right path."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 109:
		dialogue_text = "Claire: And... if someone’s really going down the wrong road, I report that to Eternos. But don’t worry—"
		Claire_Face.texture = Worrying

	elif dialogue == 110:
		dialogue_text = "Claire: I’d much rather help than judge."
		Claire_Face.texture = very_happy

	elif dialogue == 111:
		dialogue_text = "Player: That sounds... a little scary."

	elif dialogue == 112:
		dialogue_text = "Claire: Hey, stay on my good side, and we’ll get along just fine."
		Claire_Face.texture = Happy

	elif dialogue == 113:
		dialogue_text = "Claire: Actually, since I work at the tavern, I could help you get a job there too."
		Claire_Face.texture = very_happy

	elif dialogue == 114:
		dialogue_text = "Claire: You can drop in and work whenever you like."
		Claire_Face.texture = Happy

	elif dialogue == 115:
		dialogue_text = "Claire: The pay depends on your skills, but just so you know—no one gets more than 50 coins."
		Claire_Face.texture = Eyebrowing

	elif dialogue == 116:
		dialogue_text = "Claire: It’s a cozy little tavern, not a treasure vault."
		Claire_Face.texture = Open_Mouth_Happy
	elif dialogue == 117:
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 150:
		Claire.global_position.x = 550
		Claire.global_position.y = 380
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Claire_Music.play()
		dialogue_text = "Player: Hey Claire, do you have a minute? I kinda wanted to talk."
		Claire_Face.texture = Happy
	elif dialogue == 151:
		dialogue_text = "Claire: Oh, hey! Of course. What’s on your mind?"
		Claire_Face.texture = very_happy
	elif dialogue == 152:
		dialogue_text = "Player: Nothing serious. Just… figured I should get to know the person who’s helping guide my soul and all."

	elif dialogue == 153:
		dialogue_text = "Claire:Fair enough. Well, I’m all yours—ask away."
		Claire_Face.texture = very_happy

	elif dialogue == 154:
		dialogue_text = "Player: Alright then. What’s your usual day like?"

	elif dialogue == 155:
		dialogue_text = "Claire: Let’s see… I work at the tavern around noon and into the evening. Mornings and late nights, I’m usually in my room upstairs."
		Claire_Face.texture = Happy

	elif dialogue == 156:
		dialogue_text = "Claire: That’s the best time if you ever want to chat or need something."
		Claire_Face.texture = very_happy

	elif dialogue == 157:
		dialogue_text = "Player: And midnight?"

	elif dialogue == 158:
		dialogue_text = "Claire: Midnight? Don't even try. Doors locked. Lights out. I'm deep in dreamland by then."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 159:
		dialogue_text = "Player: Got it. Respect your sleep. Check."

	elif dialogue == 160:
		dialogue_text = "Claire: Good. I like you already."
		Claire_Face.texture = very_happy

	elif dialogue == 161:
		dialogue_text = "Player: You mentioned before that you’re not from this world either… same as me?"
	
	elif dialogue == 162:
		dialogue_text = "Claire: Yeah… I used to live somewhere else. Different time. Different place."
		Claire_Face.texture = Sad

	elif dialogue == 163:
		dialogue_text = "Claire: After I passed, Eternos brought me here—just like you."
		Claire_Face.texture = Worrying

	elif dialogue == 164:
		dialogue_text = "Player: But you’re not a fighter?"

	elif dialogue == 165:
		dialogue_text = "Claire: Nope. My role's different. I don’t need to battle monsters or level up."
		Claire_Face.texture = Uninterested

	elif dialogue == 166:
		dialogue_text = "Claire: I’m here to guide others… souls like yours. Help you find your footing, point you in the right direction."
		Claire_Face.texture = Happy

	elif dialogue == 167:
		dialogue_text = "Player: Sounds like a lot of responsibility."

	elif dialogue == 168:
		dialogue_text = "Claire: It is. But I don’t mind. I like helping people."
		Claire_Face.texture = very_happy

	elif dialogue == 169:
		dialogue_text = "Claire: Though… if someone goes too far off the path, I do have to report that to Eternos."
		Claire_Face.texture = Eyebrowing

	elif dialogue == 170:
		dialogue_text = "Player: Huh... That part sounds kinda ominous."

	elif dialogue == 171:
		dialogue_text = "Claire: Then just make sure you stay on my good side, and you’ve got nothing to worry about."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 172:
		dialogue_text = "Player: Deal. So... any tips for surviving here?"

	elif dialogue == 173:
		dialogue_text = "Claire: Plenty. But here’s one: if you ever need extra coins, I can help you get work at the tavern."
		Claire_Face.texture = very_happy

	elif dialogue == 174:
		dialogue_text = "Claire: You can stop by anytime. They’ll pay you based on how well you do."
		Claire_Face.texture = Happy

	elif dialogue == 175:
		dialogue_text = "Player: Sounds good. How much does the job pay?"
	elif dialogue == 176:
		dialogue_text = "Claire: No more than fifty coins a shift, even for the talented ones."
		Claire_Face.texture = Uninterested

	elif dialogue == 177:
		dialogue_text = "Claire: It’s a tavern—not a royal treasury."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 178:
		dialogue_text = "Player:Fair enough. Thanks, Claire. I’m glad you’re here."

	elif dialogue == 179:
		dialogue_text = "Claire: Me too. Really. And hey—whatever you need, I’m around."
		Claire_Face.texture = very_happy
	elif dialogue == 180:
		get_tree().change_scene_to_file(Game_Scene)
		
	elif dialogue == 200:
		Claire.global_position.x = 550
		Claire.global_position.y = 380
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Claire_Music.play()
		dialogue_text = "Player: You know, I’ve been thinking… you’ve got a lot on your plate with working at the tavern, but if you ever need a break, I’d be happy to keep you company."
		Claire_Face.texture = Happy
	elif dialogue == 201:
		dialogue_text = "Claire: That’s kind of you to say. But I’m afraid I’m really dedicated to my work there. It keeps me busy enough that I don’t have time for much else."
		Claire_Face.texture = Worrying
	elif dialogue == 202:
		dialogue_text = "Player: I understand. Just thought I’d offer—might be nice to have someone around to chat with every now and then."
		Claire_Face.texture = very_happy

	elif dialogue == 203:
		dialogue_text = "Claire: I do appreciate the thought."
		Claire_Face.texture = Open_Mouth_Happy

	elif dialogue == 204:
		dialogue_text = "Player: Fair enough. I can’t blame you for focusing on what’s important."
		Claire_Face.texture = Uninterested

	elif dialogue == 205:
		dialogue_text = "Claire: You’re a good sport about it. Maybe once you’ve got everything sorted out, we can have a proper conversation without distractions."
		Claire_Face.texture = Questioning

	elif dialogue == 206:
		dialogue_text = "Player: That sounds good to me. I’m sure I’ll be back for a chat when I’m not so caught up with everything."
		Claire_Face.texture = Happy

	elif dialogue == 207:
		dialogue_text = "Claire: I’ll be here whenever you need advice or just someone to talk to. Just don’t expect anything more than that, alright?"
		Claire_Face.texture = very_happy

	elif dialogue == 208:
		dialogue_text = "Player: Understood. I can work with that."
		Claire_Face.texture = Open_Mouth_Happy
	elif dialogue == 209:
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 230:
		Claire.global_position.x = 550
		Claire.global_position.y = 380
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Claire_Music.play()
		dialogue_text = "Player: Hey, here’s a joke for you. You know when a slime asks another slime out on a date? It's called a... valenslime!"
		Claire_Face.texture = Questioning
	elif dialogue == 231:
		dialogue_text = "Claire: Uh… That’s… uh, an interesting one. I guess it’s kind of clever? But… not really my kind of humor."
		Claire_Face.texture = Uninterested
	elif dialogue == 232:
		dialogue_text = "Player: What? Come on, I thought it was a good one!"
		Claire_Face.texture = Sad

	elif dialogue == 233:
		dialogue_text = "Claire: I’m sure it’s funny in some universe, but I don’t think that one’s going to get me laughing anytime soon."
		Claire_Face.texture = Eyebrowing

	elif dialogue == 234:
		dialogue_text = "Player: Oh, come on! You’re killing me here."
		Claire_Face.texture = very_happy

	elif dialogue == 235:
		dialogue_text = "Claire: Maybe just… no more slime jokes for now? I can only take so much slime-related humor in one day."
		Claire_Face.texture = Worrying

	elif dialogue == 236:
		dialogue_text = "Player: Fair enough. I’ll save the rest of my slime material for another time."
		Claire_Face.texture = Happy

	elif dialogue == 237:
		dialogue_text = "Claire: Good call. You’ll keep me from turning into one of them if you do."
		Claire_Face.texture = very_happy
	elif dialogue == 238:
		get_tree().change_scene_to_file(Game_Scene)
		
	elif dialogue == 250:
		Claire.global_position.x = 550
		Claire.global_position.y = 380
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Claire_Music.play()
		dialogue_text = "Claire: Hey, I’ve got a task for you. Could you go and pick up a package from Lydia? She’s the alchemist who runs the potion shop downtown. Some people even call her a witch."
		Claire_Face.texture = Questioning
	elif dialogue == 251:
		dialogue_text = "Player: A witch, huh? Sounds interesting. What’s in the package?"
		Claire_Face.texture = Eyebrowing

	elif dialogue == 252:
		dialogue_text = "Claire: It’s just some potions. Nothing too special, really. I’m sure Lydia’s got a ton of them lying around."
		Claire_Face.texture = Happy

	elif dialogue == 253:
		dialogue_text = "Player: Why do I have to run errands for you?"
		Claire_Face.texture = Sad

	elif dialogue == 254:
		dialogue_text = "Claire: Well, you’re staying here rent-free, aren’t you? At the very least, you can do whatever I ask. Consider it a small favor in exchange for all the room and board I’m providing."
		Claire_Face.texture = Pissed

	elif dialogue == 255:
		dialogue_text = "Player: Fair enough. I’ll get the package for you. No hesitation."
		Claire_Face.texture = very_happy

	elif dialogue == 256:
		dialogue_text = "Claire: Appreciate it. Lydia’s shop is on the main street, you can’t miss it. Thanks for helping out."
		Claire_Face.texture = Happy
		Global.claire_quest = 1
	elif dialogue == 257:
		get_tree().change_scene_to_file(Game_Scene)
	
	elif dialogue == 300:
		Claire.global_position.x = 550
		Claire.global_position.y = 380
		Bg.modulate = Color(1.0, 0.74, 0.85)
		Claire_Music.play()
		dialogue_text = "Claire: Have you got the package?"
		Claire_Face.texture = Questioning
	elif dialogue == 301:
		dialogue_text = "Player: Nope"
		Claire_Face.texture = Pissed
	elif dialogue == 302:
		dialogue_text = "Claire: Why the delay, she doesnt live in another city."
		Claire_Face.texture = Pissed
	elif dialogue == 303:
		dialogue_text = "Player: I'll get the package from Lydia as soon as possible."
		Claire_Face.texture = Pissed
	elif dialogue == 304:
		get_tree().change_scene_to_file(Game_Scene)





