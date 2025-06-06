extends Control

@onready var Grid_List = $GridContainer

var textures = {
	"punch": preload("res://Assets/Skills_art/Punch_button.png"),
	"kick": preload("res://Assets/Skills_art/Kick_button.png"),
	"magic_blast": preload("res://Assets/Skills_art/Magic_Blast_button.png"),
	"magic_seeker": preload("res://Assets/Skills_art/Magic_Seeker_button.png"),
	"acid_potion": preload("res://Assets/Skills_art/AcidPotion_Button.png"),
	"strong_punch": preload("res://Assets/Skills_art/Strong_Punch_Button.png"),
	"sword_slash": preload("res://Assets/Skills_art/Sword_Slash_button.png")
}

func _ready():
	_add_skill_button("punch", _on_punch_pressed)

	if Skill.Kick_Unlocked:
		_add_skill_button("kick", _on_kick_pressed)
	
	if Skill.Strong_Punch_Unlocked:
		_add_skill_button("strong_punch", _on_strong_punch_pressed)
	
	if Skill.Sword_Slash_Unlocked:
		if Player.Weapon_Type == "Sword":
			_add_skill_button("sword_slash", _on_sword_slash_pressed)

	if Skill.Magic_Blast_Unlocked:
		_add_skill_button("magic_blast", _on_magic_blast_pressed)

	if Skill.Magic_Seeker_Unlocked:
		_add_skill_button("magic_seeker", _on_magic_seeker_pressed)

	if Skill.Acid_Potion_Unlocked:
		_add_skill_button("acid_potion", _on_acid_potion_pressed)


func _add_skill_button(texture_key: String, callback: Callable):
	var btn = TextureButton.new()
	btn.texture_normal = textures[texture_key]
	btn.connect("button_up", callback)
	Grid_List.add_child(btn)

# Skill button callbacks

func _on_punch_pressed():
	if Player.EN >= 5:
		GlobalButtonClick.button_click()
		BattleMech.Selected_Skill = Skill.Punch.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "basic_hit"
		BattleMech.turn_order = 1
		queue_free()

func _on_kick_pressed():
	if Player.EN >= 25:
		GlobalButtonClick.button_click()
		BattleMech.Selected_Skill = Skill.Kick.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "basic_hit"
		BattleMech.turn_order = 1
		queue_free()

func _on_sword_slash_pressed():
	if Player.EN >= 20:
		GlobalButtonClick.button_click()
		BattleMech.Selected_Skill = Skill.Sword_Slash.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "basic_hit"
		BattleMech.turn_order = 1
		queue_free()

func _on_magic_blast_pressed():
	if Player.MP >= 50:
		GlobalButtonClick.button_click()
		BattleMech.Selected_Skill = Skill.Active_Magic_Blast.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "magic_blast"
		BattleMech.turn_order = 1
		queue_free()

func _on_magic_seeker_pressed():
	if Player.MP >= 500:
		GlobalButtonClick.button_click()
		BattleMech.Selected_Skill = Skill.Active_Magic_Seeker.bind()
		BattleMech.Selected_Action = BattleMech.Player_AOE_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "magic_seeker"
		BattleMech.turn_order = -1
		queue_free()

func _on_acid_potion_pressed():
	if Inventory.Acid_potion > 0:
		BattleMech.Selected_Skill = Skill.Use_Acid_Potion.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "acid_potion"
		BattleMech.turn_order = 1
		queue_free()

func _on_strong_punch_pressed():
	if Player.EN >= 100:
		BattleMech.Selected_Skill = Skill.Strong_Punch.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.Player_Skill_Effect = "basic_hit"
		BattleMech.turn_order = 1
		queue_free()

func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	queue_free()
