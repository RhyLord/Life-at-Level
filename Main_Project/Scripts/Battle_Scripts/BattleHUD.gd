extends Node2D


@onready var Victory = load("res://Scenes/Battles/enemy_defeated_scene.tscn") as PackedScene
@export var Faliure = "res://Scenes/Battles/player_dead.tscn"

#Effects
@onready var Hit_FX = preload("res://Scenes/Effects/basic_hit_effect.tscn")
@onready var Magic_Blast_FX = preload("res://Scenes/Effects/magic_blast_effect.tscn")
@onready var Magic_Seeker_FX = preload("res://Scenes/Effects/magic_seeker_effect.tscn")
@onready var Acid_Potion_FX = preload("res://Scenes/Effects/acidpotion_effect.tscn")



var Green_Slime_Texture = preload("res://Assets/Card_art/GreenSlime_Card.png")
var Acid_Slime_Texture = preload("res://Assets/Card_art/AcidSlime_Card.png")
var Poison_Slime_Texture = preload("res://Assets/Card_art/PoisonSlime_Card.png")
var Lava_Slime_Texture = preload("res://Assets/Card_art/LavaSlime_Card.png")
var Aqua_Slime_Texture = preload("res://Assets/Card_art/AquaSlime_Card.png")
var Magic_Slime_Texture = preload("res://Assets/Card_art/MagicSlime_Card.png")
var Metallic_Slime_Texture = preload("res://Assets/Card_art/MetallicSlime_Card.png")

var Skull_Texture = preload("res://Assets/Items_Art/Skull_Item.png")
var Skeleton_Texture = preload("res://Assets/Card_art/Skeleton_Card.png")
var Wooden_Sword_Skeleton_Texture = preload("res://Assets/Card_art/Wooden_Sword_Skeleton_Card.png")

@onready var Enemy_Cards = [
	$Enemy_Card_1,
	$Enemy_Card_2,
	$Enemy_Card_3,
	$Enemy_Card_4,
	$Enemy_Card_5
]


@onready var Player_Card = $Player_Card

@onready var Desc_txt = $Stat_Holder/Desc
@onready var Option_Holder = $Options_holder
@onready var Title_TXT = $Dungeon_Name_Txt

@onready var HP_Bar = $Stat_Holder/HealthBar
@onready var HP_TXT = $Stat_Holder/HealthBar/HPTXTLabel
@onready var MP_Bar = $Stat_Holder/ManaBar
@onready var MP_TXT = $Stat_Holder/ManaBar/MPTXTLabel
@onready var EN_Bar = $Stat_Holder/ENBar
@onready var EN_TXT = $Stat_Holder/ENBar/ENTXTLabel

@onready var music_player = $AudioStreamPlayer2D


@onready var Enemy_HP_Bar_1 = $Enemy_Card_1/HealthBar
@onready var Enemy_HP_TXT_1 = $Enemy_Card_1/HealthBar/HPTXTLabel
@onready var Enemy_Name_1 = $Enemy_Card_1/Enemy_Name_1
@onready var Enemy_Image1 = $Enemy_Card_1/Enemy_Image

@onready var Enemy_HP_Bar_2 = $Enemy_Card_2/HealthBar
@onready var Enemy_HP_TXT_2 = $Enemy_Card_2/HealthBar/HPTXTLabel
@onready var Enemy_Name_2 = $Enemy_Card_2/Enemy_Name
@onready var Enemy_Image2 = $Enemy_Card_2/Enemy_Image_2

@onready var Enemy_HP_Bar_3 = $Enemy_Card_3/HealthBar
@onready var Enemy_HP_TXT_3 = $Enemy_Card_3/HealthBar/HPTXTLabel
@onready var Enemy_Name_3 = $Enemy_Card_3/Enemy_Name
@onready var Enemy_Image3 = $Enemy_Card_3/Enemy_Image_3

@onready var Enemy_HP_Bar_4 = $Enemy_Card_4/HealthBar
@onready var Enemy_HP_TXT_4 = $Enemy_Card_4/HealthBar/HPTXTLabel
@onready var Enemy_Name_4 = $Enemy_Card_4/Enemy_Name
@onready var Enemy_Image4 = $Enemy_Card_4/Enemy_Image_4

@onready var Enemy_HP_Bar_5 = $Enemy_Card_5/HealthBar
@onready var Enemy_HP_TXT_5 = $Enemy_Card_5/HealthBar/HPTXTLabel
@onready var Enemy_Name_5 = $Enemy_Card_5/Enemy_Name
@onready var Enemy_Image5 = $Enemy_Card_5/Enemy_Image_5

@onready var buttons = [
	$Button_Holder/Button,
	$Button_Holder/Button2,
	$Button_Holder/Button3,
	$Button_Holder/Button4,
	$Button_Holder/Button5
]

func _ready():
	Set_Enemy_Image()
	Set_Core_Stats()
	BattleMech.Player_Card_Position(Player_Card)
	BattleMech.assign_multiple_enemy_positions(Enemy_Cards, buttons)

func player_dead():
	if Player.HP <= 0:
		music_player.stop()
		get_tree().change_scene_to_file(Faliure)

func _physics_process(delta):
	if PreBattleData.Refresh_Active:
		Set_Core_Stats()
		player_dead()
		PreBattleData.Refresh_Active = false
	
	if BattleMech.turn_order == 1:
		Option_Holder.visible = false
		Desc_txt.text = "Select Target"
		
	if BattleMech.turn_order == -1:
		Option_Holder.visible = false
		BattleMech.Perform_Stored_func()
		effects_on_enemy()
		Player.reset_all_dmg()
		BattleMech.turn_order = 2
		


func Set_Core_Stats():
	HP_Bar.max_value = Player.MAX_HP
	HP_Bar.value = Player.HP
	HP_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.HP, Player.MAX_HP]
		
	MP_Bar.max_value = Player.MAX_MP
	MP_Bar.value = Player.MP
	MP_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.MP, Player.MAX_MP]

	EN_Bar.max_value = Player.MAX_EN
	EN_Bar.value = Player.EN
	EN_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.EN, Player.MAX_EN]

	Title_TXT.text = "[center][b][outline_size=3][outline_color=#000000][font_size=40]" + PreBattleData.Dungeon_start_name + "[/font_size][/outline_color][/outline_size][/b][/center]"
		
	Desc_txt.text = PreBattleData.description_txt
	
	Enemy_HP_Bar_1.max_value = Enemy1Data.MAX_HP
	Enemy_HP_Bar_1.value = Enemy1Data.HP
	Enemy_HP_TXT_1.bbcode_text = "[center]%d / %d[/center]" % [Enemy1Data.HP, Enemy1Data.MAX_HP]
	Enemy_Name_1.text = "[center]" + Enemy1Data.Enemy_name + "[/center]"
	
	Enemy_HP_Bar_2.max_value = Enemy2Data.MAX_HP
	Enemy_HP_Bar_2.value = Enemy2Data.HP
	Enemy_HP_TXT_2.bbcode_text = "[center]%d / %d[/center]" % [Enemy2Data.HP, Enemy2Data.MAX_HP]
	Enemy_Name_2.text = "[center]" + Enemy2Data.Enemy_name + "[/center]"
	
	Enemy_HP_Bar_3.max_value = Enemy3Data.MAX_HP
	Enemy_HP_Bar_3.value = Enemy3Data.HP
	Enemy_HP_TXT_3.bbcode_text = "[center]%d / %d[/center]" % [Enemy3Data.HP, Enemy3Data.MAX_HP]
	Enemy_Name_3.text = "[center]" + Enemy3Data.Enemy_name + "[/center]"

	Enemy_HP_Bar_4.max_value = Enemy4Data.MAX_HP
	Enemy_HP_Bar_4.value = Enemy4Data.HP
	Enemy_HP_TXT_4.bbcode_text = "[center]%d / %d[/center]" % [Enemy4Data.HP, Enemy4Data.MAX_HP]
	Enemy_Name_4.text = "[center]" + Enemy4Data.Enemy_name + "[/center]"

	Enemy_HP_Bar_5.max_value = Enemy5Data.MAX_HP
	Enemy_HP_Bar_5.value = Enemy5Data.HP
	Enemy_HP_TXT_5.bbcode_text = "[center]%d / %d[/center]" % [Enemy5Data.HP, Enemy5Data.MAX_HP]
	Enemy_Name_5.text = "[center]" + Enemy5Data.Enemy_name + "[/center]"
	
	if Enemy1Data.Alive == false:
		Enemy_Cards[0].visible = false
	if Enemy2Data.Alive == false:
		Enemy_Cards[1].visible = false
	if Enemy3Data.Alive == false:
		Enemy_Cards[2].visible = false
	if Enemy4Data.Alive == false:
		Enemy_Cards[3].visible = false
	if Enemy5Data.Alive == false:
		Enemy_Cards[4].visible = false
		
	Enemy_Attack_Check()

func Enemy_Attack_Check():
	# Check if at least one enemy is alive
	BattleMech.All_Enemy_Alive = false
	for enemy_data in [Enemy1Data, Enemy2Data, Enemy3Data, Enemy4Data, Enemy5Data]:
		if enemy_data.Alive:
			BattleMech.All_Enemy_Alive = true
			break  # Exit early if at least one is alive

	# If all enemies are dead, show victory scene
	if not BattleMech.All_Enemy_Alive:
		for enemy in Enemy_Cards:
			if enemy is CanvasItem:  # Ensure it's a valid node with a visibility property
				enemy.visible = false
		var victory_scn = Victory.instantiate()
		get_tree().current_scene.add_child(victory_scn)
		return  # Stop execution

	# Handle enemy attacks based on turn order
	Option_Holder.visible = false

	# Enemy attack sequence
	while BattleMech.turn_order in [2, 3, 4, 5, 6]:
		match BattleMech.turn_order:
			2:
				if Enemy1Data.Alive:
					BattleMech.Enemy_Attack_1()
					return
				else:
					if Enemy_Cards[0] is CanvasItem:
						Enemy_Cards[0].visible = false
			3:
				if Enemy2Data.Alive:
					BattleMech.Enemy_Attack_2()
					return
				else:
					if Enemy_Cards[1] is CanvasItem:
						Enemy_Cards[1].visible = false
			4:
				if Enemy3Data.Alive:
					BattleMech.Enemy_Attack_3()
					return
				else:
					if Enemy_Cards[2] is CanvasItem:
						Enemy_Cards[2].visible = false
			5:
				if Enemy4Data.Alive:
					BattleMech.Enemy_Attack_4()
					return
				else:
					if Enemy_Cards[3] is CanvasItem:
						Enemy_Cards[3].visible = false
			6:
				if Enemy5Data.Alive:
					BattleMech.Enemy_Attack_5()
					return
				else:
					if Enemy_Cards[4] is CanvasItem:
						Enemy_Cards[4].visible = false
		
		# If the current enemy is dead, move to the next turn
		BattleMech.turn_order += 1

	# Reset turn order if all enemies in the attack sequence are dead
	BattleMech.turn_order = 0
	Option_Holder.visible = true

func Set_Enemy_Image():
	var textures = {
		"green_slime": Green_Slime_Texture,
		"acid_slime": Acid_Slime_Texture,
		"poison_slime": Poison_Slime_Texture,
		"lava_slime": Lava_Slime_Texture,
		"aqua_slime": Aqua_Slime_Texture,
		"magic_slime": Magic_Slime_Texture,
		"metallic_slime": Metallic_Slime_Texture,
		"skull": Skull_Texture,
		"skeleton": Skeleton_Texture,
		"wooden_sword_skeleton": Wooden_Sword_Skeleton_Texture
	}

	var enemies = [Enemy1Data, Enemy2Data, Enemy3Data, Enemy4Data, Enemy5Data]
	var images = [Enemy_Image1, Enemy_Image2, Enemy_Image3, Enemy_Image4, Enemy_Image5]

	for i in range(enemies.size()):
		if enemies[i].type in textures:
			images[i].texture_normal = textures[enemies[i].type]


func _on_enemy_image_button_up():
	if BattleMech.turn_order == 1:
		GlobalButtonClick.button_click()
		BattleMech.Enemy_Selected = 1
		BattleMech.Enemypos = Enemy_Cards[0].global_position
		effects_on_enemy()
		BattleMech.Perform_Stored_func()
		Player.reset_all_dmg()
		BattleMech.turn_order = 2

func _on_enemy_image_2_button_up():
	if BattleMech.turn_order == 1:
		GlobalButtonClick.button_click()
		BattleMech.Enemy_Selected = 2
		BattleMech.Enemypos = Enemy_Cards[1].global_position
		effects_on_enemy()
		BattleMech.Perform_Stored_func()
		Player.reset_all_dmg()
		BattleMech.turn_order = 2


func _on_enemy_image_3_button_up():
	if BattleMech.turn_order == 1:
		GlobalButtonClick.button_click()
		BattleMech.Enemy_Selected = 3
		BattleMech.Enemypos = Enemy_Cards[2].global_position
		effects_on_enemy()
		BattleMech.Perform_Stored_func()
		Player.reset_all_dmg()
		BattleMech.turn_order = 2


func _on_enemy_image_4_button_up():
	if BattleMech.turn_order == 1:
		GlobalButtonClick.button_click()
		BattleMech.Enemy_Selected = 4
		BattleMech.Enemypos = Enemy_Cards[3].global_position
		effects_on_enemy()
		BattleMech.Perform_Stored_func()
		Player.reset_all_dmg()
		BattleMech.turn_order = 2


func _on_enemy_image_5_button_up():
	if BattleMech.turn_order == 1:
		GlobalButtonClick.button_click()
		BattleMech.Enemy_Selected = 5
		BattleMech.Enemypos = Enemy_Cards[4].global_position
		effects_on_enemy()
		BattleMech.Perform_Stored_func()
		Player.reset_all_dmg()
		BattleMech.turn_order = 2.

func effects_on_enemy():
	if BattleMech.Player_Skill_Effect == "basic_hit":
		spawn_hit_effect()
	if BattleMech.Player_Skill_Effect == "magic_blast":
		spawn_magic_blast_effect()
	if BattleMech.Player_Skill_Effect == "magic_seeker":
		spawn_magic_seeker_effect()
	if BattleMech.Player_Skill_Effect == "acid_potion":
		spawn_acid_potion_effect()

func spawn_hit_effect():
	var hit_effect = Hit_FX.instantiate()
	hit_effect.global_position = BattleMech.Enemypos
	hit_effect.z_index = 201
	add_child(hit_effect)
	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true
	await get_tree().create_timer(0.7).timeout
	hit_effect.queue_free()

func spawn_magic_blast_effect():
	var hit_effect = Magic_Blast_FX.instantiate()
	hit_effect.global_position = BattleMech.Enemypos
	hit_effect.z_index = 201
	add_child(hit_effect)
	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true
	await get_tree().create_timer(1).timeout
	hit_effect.queue_free()

func spawn_magic_seeker_effect():
	var hit_effect = Magic_Seeker_FX.instantiate()
	hit_effect.global_position = Enemy_Cards[0].global_position
	hit_effect.z_index = 201
	add_child(hit_effect)
	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true
	await get_tree().create_timer(1.5).timeout
	hit_effect.queue_free()
	
func spawn_acid_potion_effect():
	var hit_effect = Acid_Potion_FX.instantiate()
	hit_effect.global_position = BattleMech.Enemypos
	hit_effect.z_index = 201
	add_child(hit_effect)
	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true
	await get_tree().create_timer(1).timeout
	hit_effect.queue_free()
