extends Node

var turn_order = 0
var Enemy_Selected = 0
var All_Enemy_Alive = true

var Selected_Skill
var Selected_Action

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

func Player_Attack_1(): # Primitive, fix later
	var Total_DMG = Player.compute_total_dmg()
	
	# Determine which enemy to attack based on Selected_Enemy
	match Enemy_Selected:
		1:
			Enemy1Data.HP -= Total_DMG
			Enemy1Data.Health_Check()
			PreBattleData.desciption_txt = "You dealt [" + str(Total_DMG) + "] damage to " + Enemy1Data.Enemy_name
		2:
			Enemy2Data.HP -= Total_DMG
			Enemy2Data.Health_Check()
			PreBattleData.desciption_txt = "You dealt [" + str(Total_DMG) + "] damage to " + Enemy2Data.Enemy_name
		3:
			Enemy3Data.HP -= Total_DMG
			Enemy3Data.Health_Check()
			PreBattleData.desciption_txt = "You dealt [" + str(Total_DMG) + "] damage to " + Enemy3Data.Enemy_name
		4:
			Enemy4Data.HP -= Total_DMG
			Enemy4Data.Health_Check()
			PreBattleData.desciption_txt = "You dealt [" + str(Total_DMG) + "] damage to " + Enemy4Data.Enemy_name
		5:
			Enemy5Data.HP -= Total_DMG
			Enemy5Data.Health_Check()
			PreBattleData.desciption_txt = "You dealt [" + str(Total_DMG) + "] damage to " + Enemy5Data.Enemy_name
		_:
			PreBattleData.desciption_txt = "No enemy selected!"

	turn_order = 1
	PreBattleData.Refresh_Active = true
	
func Player_Action_1(): #primitve, fix it
	Enemy1Data.Health_Check()
	turn_order = 2
	PreBattleData.Refresh_Active = true
	
func Enemy_Attack_1(): #primitive, fix later
	var TOTAL_DMG = Enemy1Data.compute_total_dmg()
	await get_tree().create_timer(0.7).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	PreBattleData.desciption_txt = Enemy1Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 3
	PreBattleData.Refresh_Active = true

func Enemy_Attack_2(): #primitive, fix later
	var TOTAL_DMG = Enemy2Data.compute_total_dmg()
	await get_tree().create_timer(0.7).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	PreBattleData.desciption_txt = Enemy2Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 4
	PreBattleData.Refresh_Active = true

func Enemy_Attack_3(): # primitive, fix later
	var TOTAL_DMG = Enemy3Data.compute_total_dmg()
	await get_tree().create_timer(0.7).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	PreBattleData.desciption_txt = Enemy3Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 5
	PreBattleData.Refresh_Active = true

func Enemy_Attack_4(): # primitive, fix later
	var TOTAL_DMG = Enemy4Data.compute_total_dmg()
	await get_tree().create_timer(0.7).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	PreBattleData.desciption_txt = Enemy4Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 6
	PreBattleData.Refresh_Active = true

func Enemy_Attack_5(): # primitive, fix later
	var TOTAL_DMG = Enemy5Data.compute_total_dmg()
	await get_tree().create_timer(0.7).timeout
	Player.HP -= TOTAL_DMG
	Player.Health_Check()
	PreBattleData.desciption_txt = Enemy5Data.Enemy_name + " dealt [" + str(TOTAL_DMG) + "] damage to you."
	turn_order = 0  # Reset to player's turn after last enemy attack
	PreBattleData.Refresh_Active = true
