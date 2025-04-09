extends Node

var turn_order = 0
var Enemy_Selected = 0
var All_Enemy_Alive = true
var Enemypos
var Player_Skill_Effect

var Selected_Skill
var Selected_Action

@onready var greenslime_effect = load("res://Scenes/Effects/greenslime_effect.tscn")
@onready var acidslime_effect = load("res://Scenes/Effects/acidslime_effect.tscn")
@onready var poisonslime_effect = load("res://Scenes/Effects/poisonslime_effect.tscn")
@onready var lavaslime_effect = load("res://Scenes/Effects/lavaslime_effect.tscn")
@onready var aquaslime_effect = load("res://Scenes/Effects/aquaslime_effect.tscn")
@onready var magicslime_effect = load("res://Scenes/Effects/magicslime_effect.tscn")
@onready var metallicslime_effect = load("res://Scenes/Effects/metalslime_effect.tscn")

var enemies = []

func _ready():
	enemies = [Enemy1Data, Enemy2Data, Enemy3Data, Enemy4Data, Enemy5Data]

func Set_Default():
	turn_order = 0
	All_Enemy_Alive = true

func Perform_Stored_func():
	if Selected_Skill and Selected_Action:
		Selected_Skill.call()
		Selected_Action.call()

func Player_Card_Position(Player_card):
	Player_card.global_position = Vector2(PreBattleData.Player_position_x, PreBattleData.Player_position_y)

func assign_multiple_enemy_positions(enemy_cards: Array, buttons: Array):
	"""Assigns enemy cards to buttons in order without shuffling."""
	if buttons.size() < enemy_cards.size():
		print("Not enough buttons for all enemies!")
		return

	# Assign enemy cards to buttons in order (0 to 4)
	for i in range(enemy_cards.size()):
		enemy_cards[i].global_position = buttons[i].global_position

func Player_Attack_1():
	var index = Enemy_Selected - 1

	if index >= 0 and index < enemies.size():
		compute_enemy_def(enemies[index])
		var Total_DMG = Player.compute_total_dmg()
		enemies[index].HP -= Total_DMG
		enemies[index].Health_Check()
		PreBattleData.description_txt = "You dealt [%d] damage to %s" % [Total_DMG, enemies[index].Enemy_name]
	else:
		PreBattleData.description_txt = "No enemy selected!"

	turn_order = 1
	PreBattleData.Refresh_Active = true
	
func Player_Action_1():
	turn_order = 2
	PreBattleData.Refresh_Active = true

func Player_AOE_Attack_1():
	var Total_DMG = Player.compute_total_dmg()
	for enemy in enemies:
		if enemy.Alive:
			enemy.HP -= Total_DMG
			enemy.Health_Check()
			
	PreBattleData.description_txt = "You dealt [%d] damage to all enemies" % [Total_DMG]
	turn_order = 1
	PreBattleData.Refresh_Active = true		

func compute_enemy_def(enemy):
	var target = enemy
	Player.PHYSICAL_DMG = max((Player.PHYSICAL_DMG - target.PHYSICAL_DEF),0)

func Enemy_Attack_1(): #primitive, fix later
	var TOTAL_DMG = Enemy1Data.compute_total_dmg()
	await get_tree().create_timer(0.8).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	Enemy_attack_effect()
	PreBattleData.description_txt = Enemy1Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 3
	PreBattleData.Refresh_Active = true

func Enemy_Attack_2(): #primitive, fix later
	var TOTAL_DMG = Enemy2Data.compute_total_dmg()
	await get_tree().create_timer(0.8).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	Enemy_attack_effect()
	PreBattleData.description_txt = Enemy2Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 4
	PreBattleData.Refresh_Active = true

func Enemy_Attack_3(): # primitive, fix later
	var TOTAL_DMG = Enemy3Data.compute_total_dmg()
	await get_tree().create_timer(0.8).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	Enemy_attack_effect()
	PreBattleData.description_txt = Enemy3Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 5
	PreBattleData.Refresh_Active = true

func Enemy_Attack_4(): # primitive, fix later
	var TOTAL_DMG = Enemy4Data.compute_total_dmg()
	await get_tree().create_timer(0.8).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	Enemy_attack_effect()
	PreBattleData.description_txt = Enemy4Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 6
	PreBattleData.Refresh_Active = true

func Enemy_Attack_5(): # primitive, fix later
	var TOTAL_DMG = Enemy5Data.compute_total_dmg()
	await get_tree().create_timer(0.8).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	Enemy_attack_effect()
	PreBattleData.description_txt = Enemy5Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 0  # Reset to player's turn after last enemy attack
	PreBattleData.Refresh_Active = true

func Enemy_attack_effect():
	var enemy_index = BattleMech.turn_order - 2
	var enemy_data_list = [Enemy1Data, Enemy2Data, Enemy3Data, Enemy4Data, Enemy5Data]
	
	if enemy_index >= 0 and enemy_index < enemy_data_list.size():
		var enemy_data = enemy_data_list[enemy_index]
		if enemy_data.attack_effect == "greenslime":
			greenslime_attack_effect()
		elif enemy_data.attack_effect == "acidslime":
			acidslime_attack_effect()
		elif enemy_data.attack_effect == "poisonslime":
			poisonslime_attack_effect()
		elif enemy_data.attack_effect == "lavaslime":
			lavaslime_attack_effect()
		elif enemy_data.attack_effect == "aquaslime":
			aquaslime_attack_effect()
		elif enemy_data.attack_effect == "magicslime":
			magicslime_attack_effect()
		elif enemy_data.attack_effect == "metallicslime":
			metallicslime_attack_effect()

func greenslime_attack_effect():
	var hit_effect = greenslime_effect.instantiate()
	hit_effect.global_position = Vector2(
		PreBattleData.Player_position_x,
		PreBattleData.Player_position_y
	)
	hit_effect.z_index = 201
	add_child(hit_effect)

	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true

	await get_tree().create_timer(0.9).timeout
	hit_effect.queue_free()

func acidslime_attack_effect():
	var hit_effect = acidslime_effect.instantiate()
	hit_effect.global_position = Vector2(
		PreBattleData.Player_position_x,
		PreBattleData.Player_position_y
	)
	hit_effect.z_index = 201
	add_child(hit_effect)

	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true

	await get_tree().create_timer(0.9).timeout
	hit_effect.queue_free()

func poisonslime_attack_effect():
	var hit_effect = poisonslime_effect.instantiate()
	hit_effect.global_position = Vector2(
		PreBattleData.Player_position_x,
		PreBattleData.Player_position_y
	)
	hit_effect.z_index = 201
	add_child(hit_effect)

	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true

	await get_tree().create_timer(0.9).timeout
	hit_effect.queue_free()
	
func lavaslime_attack_effect():
	var hit_effect = lavaslime_effect.instantiate()
	hit_effect.global_position = Vector2(
		PreBattleData.Player_position_x,
		PreBattleData.Player_position_y
	)
	hit_effect.z_index = 201
	add_child(hit_effect)

	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true

	await get_tree().create_timer(0.9).timeout
	hit_effect.queue_free()
	
func aquaslime_attack_effect():
	var hit_effect = aquaslime_effect.instantiate()
	hit_effect.global_position = Vector2(
		PreBattleData.Player_position_x,
		PreBattleData.Player_position_y
	)
	hit_effect.z_index = 201
	add_child(hit_effect)

	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true

	await get_tree().create_timer(0.9).timeout
	hit_effect.queue_free()

func magicslime_attack_effect():
	var hit_effect = magicslime_effect.instantiate()
	hit_effect.global_position = Vector2(
		PreBattleData.Player_position_x,
		PreBattleData.Player_position_y
	)
	hit_effect.z_index = 201
	add_child(hit_effect)

	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true

	await get_tree().create_timer(0.9).timeout
	hit_effect.queue_free()

func metallicslime_attack_effect():
	var hit_effect = metallicslime_effect.instantiate()
	hit_effect.global_position = Vector2(
		PreBattleData.Player_position_x,
		PreBattleData.Player_position_y
	)
	hit_effect.z_index = 201
	add_child(hit_effect)

	var particles = hit_effect.get_node("CPUParticles2D")
	if particles:
		particles.emitting = true

	await get_tree().create_timer(0.9).timeout
	hit_effect.queue_free()
