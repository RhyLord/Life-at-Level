extends Control

@onready var Grid_List = $GridContainer
@onready var Skill_Button_1 = $GridContainer/Skill_Button_1
@onready var Skill_Button_2 = $GridContainer/Skill_Button_2
@onready var Skill_Button_3 = $GridContainer/Skill_Button_3
@onready var Skill_Button_4 = $GridContainer/Skill_Button_4
@onready var Skill_Button_5 = $GridContainer/Skill_Button_5
@onready var Skill_Button_6 = $GridContainer/Skill_Button_6

@onready var Skill_TXT_1 = $GridContainer/Skill_Button_1/Cost_TXT
@onready var Skill_TXT_2 = $GridContainer/Skill_Button_2/Cost_TXT
@onready var Skill_TXT_3 = $GridContainer/Skill_Button_3/Cost_TXT
@onready var Skill_TXT_4 = $GridContainer/Skill_Button_4/Cost_TXT
@onready var Skill_TXT_5 = $GridContainer/Skill_Button_5/Cost_TXT
@onready var Skill_TXT_6 = $GridContainer/Skill_Button_6/Cost_TXT


@onready var textures = {
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png"),
	"punch": preload("res://Assets/Skills_art/Punch_button.png"),
	"kick": preload("res://Assets/Skills_art/Kick_button.png"),
	"magic_blast": preload("res://Assets/Skills_art/Magic_Blast_button.png"),
	"magic_seeker": preload("res://Assets/Skills_art/Magic_Seeker_button.png"),
	"acid_potion": preload("res://Assets/Skills_art/AcidPotion_Button.png"),
	"strong_punch": preload("res://Assets/Skills_art/Strong_Punch_Button.png")
}

func _ready():
	Skill_Button_1.texture_normal = textures["punch"]
	Skill_TXT_1.text = "[center][-5] EN [/center]"
	
	if Skill.Kick_Unlocked == true:
		Skill_Button_2.texture_normal = textures["kick"]
		Skill_TXT_2.text = "[center][-25] EN[/center]"
	
	if Skill.Magic_Blast_Unlocked == true:
		Skill_Button_3.texture_normal = textures["magic_blast"]
		Skill_TXT_3.text = "[center][-50] MP[/center]"
		
	if Skill.Magic_Seeker_Unlocked == true:
		Skill_Button_4.texture_normal = textures["magic_seeker"]
		Skill_TXT_4.text = "[center][-500] MP[/center]"
		
	if Skill.Acid_Potion_Unlocked == true:
		Skill_Button_5.texture_normal = textures["acid_potion"]
		Skill_TXT_5.text = "[center]Available [" + str(Inventory.Acid_potion) + "][/center]"
		
	if Skill.Strong_Punch_Unlocked == true:
		Skill_Button_6.texture_normal = textures["strong_punch"]
		Skill_TXT_6.text = "[center][-100] EN[/center]"

func _on_go_back_button_button_up():
	queue_free()


func _on_skill_button_1_button_up():
	if Player.EN >= 5:
		BattleMech.Selected_Skill = Skill.Punch.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "basic_hit"
		BattleMech.turn_order = 1
		queue_free()

func _on_skill_button_2_button_up():
	if (Player.EN >= 25) and (Skill.Kick_Unlocked == true):
		BattleMech.Selected_Skill = Skill.Kick.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "basic_hit"
		BattleMech.turn_order = 1
		queue_free()

func _on_skill_button_3_button_up():
	if (Player.MP >= 50) and (Skill.Magic_Blast_Unlocked == true):
		BattleMech.Selected_Skill = Skill.Active_Magic_Blast.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "magic_blast"
		BattleMech.turn_order = 1
		queue_free()

func _on_skill_button_4_button_up():
	if (Player.MP >= 500) and (Skill.Magic_Seeker_Unlocked == true):
		BattleMech.Selected_Skill = Skill.Active_Magic_Seeker.bind()
		BattleMech.Selected_Action = BattleMech.Player_AOE_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "magic_seeker"
		BattleMech.turn_order = -1 # -1 is for AOE attack
		queue_free()


func _on_skill_button_5_button_up():
	if (Inventory.Acid_potion > 0) and (Skill.Acid_Potion_Unlocked == true):
		BattleMech.Selected_Skill = Skill.Use_Acid_Potion.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "acid_potion"
		BattleMech.turn_order = 1
		queue_free()


func _on_skill_button_6_button_up():
	if (Player.EN >= 100) and (Skill.Strong_Punch_Unlocked == true):
		BattleMech.Selected_Skill = Skill.Strong_Punch.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "basic_hit"
		BattleMech.turn_order = 1
		queue_free()
