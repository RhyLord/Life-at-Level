extends Node

var save_path = "user://Life_At_Level.save"

var LVL = 1
var XP = 0
var XP_NXT = calculate_xp_needed(LVL)
var Allocation_points = 0

var Weapon = "None"
var Weapon_Type = "None"

var new_game = 0

var coin = 0

func calculate_xp_needed(level: int) -> int:
	return 100 * (level * level)

func level_up_player():
	while XP >= XP_NXT:
		XP -= XP_NXT
		LVL += 1
		Allocation_points += 10
		XP_NXT = calculate_xp_needed(LVL)


var HP = 10
var MAX_HP = 10
var MP = 10
var MAX_MP = 10
var EN = 10
var MAX_EN = 10

var STR = 1
var DEX = 1
var AGI = 1
var VIT = 0
var END = 0
var INT = 1

var WIS = 0
var CHA = 1
var LUK = 1
var CTRL = 1

var ACCURACY = 0

#DAMAGE
var PHYSICAL_DMG = 0
var SHARP_DMG = 0
var ACID_DMG = 0
var MAGIC_DMG = 0
var WATER_DMG = 0
var EARTH_DMG = 0
var AIR_DMG = 0
var DARK_DMG = 0
var LIGHT_DMG = 0
var POISON_DMG = 0
var ELECTRIC_DMG = 0
var MIND_DMG = 0
var FIRE_DMG = 0
var DIVINE_DMG = 0
var TOTAL_DMG = 0

#Weappon Damage
var SWORD_DMG = 0

#DEFENSE
var PHYSICAL_DEF = 0
var WATER_DEF = 0
var TOTAL_DEF = 0


func Set_Health():
	HP = MAX_HP

func Mana_Check():
	if MP < 0:
		MP = 0
	elif MP > MAX_MP:
		MP = MAX_MP

func Health_Check():
	if HP < 0:
		HP = 0
	elif HP > MAX_HP:
		HP = MAX_HP

func compute_total_dmg():
	TOTAL_DMG = (
		PHYSICAL_DMG + SHARP_DMG + MAGIC_DMG + WATER_DMG + EARTH_DMG + 
		AIR_DMG + DARK_DMG + LIGHT_DMG + POISON_DMG + ELECTRIC_DMG + 
		MIND_DMG + FIRE_DMG + DIVINE_DMG + ACID_DMG
	)
	return TOTAL_DMG
	
func reset_all_dmg():
	PHYSICAL_DMG = 0
	SHARP_DMG = 0
	MAGIC_DMG = 0
	WATER_DMG = 0
	EARTH_DMG = 0
	AIR_DMG = 0
	DARK_DMG = 0
	LIGHT_DMG = 0
	POISON_DMG = 0
	ELECTRIC_DMG = 0
	MIND_DMG = 0
	FIRE_DMG = 0
	DIVINE_DMG = 0
	ACID_DMG = 0
	TOTAL_DMG = 0

func Test_Game(): # add values here which you want to set to default and then save, use this for continue
	pass


func Save_Game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)

	# Player Stats
	file.store_var(HP)
	file.store_var(MAX_HP)
	file.store_var(MP)
	file.store_var(MAX_MP)
	file.store_var(EN)
	file.store_var(MAX_EN)
	file.store_var(coin)
	file.store_var(Weapon)
	file.store_var(Weapon_Type)
	
	# Attributes
	file.store_var(STR)
	file.store_var(DEX)
	file.store_var(AGI)
	file.store_var(VIT)
	file.store_var(END)
	file.store_var(INT)
	file.store_var(WIS)
	file.store_var(CHA)
	file.store_var(LUK)
	file.store_var(CTRL)

	# Accuracy
	file.store_var(ACCURACY)

	# Damage Values
	file.store_var(PHYSICAL_DMG)
	file.store_var(SHARP_DMG)
	file.store_var(ACID_DMG)
	file.store_var(MAGIC_DMG)
	file.store_var(WATER_DMG)
	file.store_var(EARTH_DMG)
	file.store_var(AIR_DMG)
	file.store_var(DARK_DMG)
	file.store_var(LIGHT_DMG)
	file.store_var(POISON_DMG)
	file.store_var(ELECTRIC_DMG)
	file.store_var(MIND_DMG)
	file.store_var(FIRE_DMG)
	file.store_var(DIVINE_DMG)
	file.store_var(TOTAL_DMG)
	
	#Weapon Damage Values
	file.store_var(SWORD_DMG)

	# Defense Values
	file.store_var(PHYSICAL_DEF)
	file.store_var(TOTAL_DEF)
	file.store_var(WATER_DEF)

	# Level & XP
	file.store_var(LVL)
	file.store_var(XP)
	file.store_var(XP_NXT)
	file.store_var(Allocation_points)

	# Time & Day
	file.store_var(Global.Time_of_day)
	file.store_var(Global.Day)
	
	# Quests
	file.store_var(Global.claire_quest)
	file.store_var(Global.claire_sub_quest)
	file.store_var(Global.lydia_quest)
	file.store_var(Global.lydia_sub_quest)
	file.store_var(Global.veronica_quest)
	file.store_var(Global.veronica_sub_quest)
	
	#NPC
	file.store_var(Global.claire)
	file.store_var(Global.lydia)
	file.store_var(Global.veronica)

	# Skills
	# Rest
	file.store_var(Skill.Rest_Unlocked)
	file.store_var(Skill.Rest_LVL)
	file.store_var(Skill.Rest_XP)
	file.store_var(Skill.Rest_NXT_XP)

	# PushUp
	file.store_var(Skill.PushUp_Unlocked)
	file.store_var(Skill.PushUp_LVL)
	file.store_var(Skill.PushUp_XP)
	file.store_var(Skill.PushUp_NXT_XP)

	# Run
	file.store_var(Skill.Run_Unlocked)
	file.store_var(Skill.Run_LVL)
	file.store_var(Skill.Run_XP)
	file.store_var(Skill.Run_NXT_XP)

	# Study
	file.store_var(Skill.Study_Unlocked)
	file.store_var(Skill.Study_LVL)
	file.store_var(Skill.Study_XP)
	file.store_var(Skill.Study_NXT_XP)
	
	# Speech
	file.store_var(Skill.Speech_Unlocked)
	file.store_var(Skill.Speech_LVL)
	file.store_var(Skill.Speech_XP)
	file.store_var(Skill.Speech_NXT_XP)

	# Punch
	file.store_var(Skill.Punch_Unlocked)
	file.store_var(Skill.Punch_LVL)
	file.store_var(Skill.Punch_XP)
	file.store_var(Skill.Punch_NXT_XP)
	
	# Strong Punch
	file.store_var(Skill.Strong_Punch_Unlocked)
	file.store_var(Skill.Strong_Punch_LVL)
	file.store_var(Skill.Strong_Punch_XP)
	file.store_var(Skill.Strong_Punch_NXT_XP)

	# Squat
	file.store_var(Skill.Squat_Unlocked)
	file.store_var(Skill.Squat_LVL)
	file.store_var(Skill.Squat_XP)
	file.store_var(Skill.Squat_NXT_XP)
	
	#Physical Endurance
	file.store_var(Skill.Physical_Endurance_Unlocked)
	file.store_var(Skill.Physical_Endurance_LVL)
	file.store_var(Skill.Physical_Endurance_XP)
	file.store_var(Skill.Physical_Endurance_NXT_XP)
	
	#Kick
	file.store_var(Skill.Kick_Unlocked)
	file.store_var(Skill.Kick_LVL)
	file.store_var(Skill.Kick_XP)
	file.store_var(Skill.Kick_NXT_XP)
	
	# Store Minor Regen skill data
	file.store_var(Skill.Minor_Regen_Unlocked)
	file.store_var(Skill.Minor_Regen_LVL)
	file.store_var(Skill.Minor_Regen_XP)
	file.store_var(Skill.Minor_Regen_NXT_XP)
	
	# Lowly Mana Regen
	file.store_var(Skill.Lowly_Mana_Regen_Unlocked)
	file.store_var(Skill.Lowly_Mana_Regen_LVL)
	file.store_var(Skill.Lowly_Mana_Regen_XP)
	file.store_var(Skill.Lowly_Mana_Regen_NXT_XP)
	
	#Magic Blast
	file.store_var(Skill.Magic_Blast_Unlocked)
	file.store_var(Skill.Magic_Blast_LVL)
	file.store_var(Skill.Magic_Blast_XP)
	file.store_var(Skill.Magic_Blast_NXT_XP)
	
	#Meditate
	file.store_var(Skill.Meditate_Unlocked)
	file.store_var(Skill.Meditate_LVL)
	file.store_var(Skill.Meditate_XP)
	file.store_var(Skill.Meditate_NXT_XP)
	
	#Shower
	file.store_var(Skill.Shower_Unlocked)
	file.store_var(Skill.Shower_LVL)
	file.store_var(Skill.Shower_XP)
	file.store_var(Skill.Shower_NXT_XP)
	
	#Magic Seeker
	file.store_var(Skill.Magic_Seeker_Unlocked)
	file.store_var(Skill.Magic_Seeker_LVL)
	file.store_var(Skill.Magic_Seeker_XP)
	file.store_var(Skill.Magic_Seeker_NXT_XP)
	
	# Potion Proficiency
	file.store_var(Skill.Potion_Proficiency_Unlocked)
	file.store_var(Skill.Potion_Proficiency_LVL)
	file.store_var(Skill.Potion_Proficiency_XP)
	file.store_var(Skill.Potion_Proficiency_NXT_XP)
	
	# –– Sword Mastery –– 
	file.store_var(Skill.Sword_Mastery_Unlocked)
	file.store_var(Skill.Sword_Mastery_LVL)
	file.store_var(Skill.Sword_Mastery_XP)
	file.store_var(Skill.Sword_Mastery_NXT_XP)
	
	# Sword Slash Save
	file.store_var(Skill.Sword_Slash_Unlocked)
	file.store_var(Skill.Sword_Slash_LVL)
	file.store_var(Skill.Sword_Slash_XP)
	file.store_var(Skill.Sword_Slash_NXT_XP)

	# Health Potion
	file.store_var(Skill.Health_Potion_Unlocked)
	file.store_var(Skill.Health_Potion_LVL)
	file.store_var(Skill.Health_Potion_XP)
	file.store_var(Skill.Health_Potion_NXT_XP)
	
	# Mana Potion
	file.store_var(Skill.Mana_Potion_Unlocked)
	file.store_var(Skill.Mana_Potion_LVL)
	file.store_var(Skill.Mana_Potion_XP)
	file.store_var(Skill.Mana_Potion_NXT_XP)
	
	# Acid Potion
	file.store_var(Skill.Acid_Potion_Unlocked)
	file.store_var(Skill.Acid_Potion_LVL)
	file.store_var(Skill.Acid_Potion_XP)
	file.store_var(Skill.Acid_Potion_NXT_XP)
	
	#DungeonData
	file.store_var(DungeonData.lowest_level_slime_1_10)
	file.store_var(DungeonData.lowest_level_slime_11_20)
	file.store_var(DungeonData.lowest_level_slime_21_30)
	file.store_var(DungeonData.lowest_level_slime_31_40)
	file.store_var(DungeonData.lowest_level_slime_41_50)
	file.store_var(DungeonData.lowest_level_slime_51_60)
	file.store_var(DungeonData.lowest_level_slime_61_70)
	file.store_var(DungeonData.lowest_level_slime_71_80)
	file.store_var(DungeonData.lowest_level_slime_81_90)
	file.store_var(DungeonData.lowest_level_slime_91_100)
	
	file.store_var(DungeonData.lowest_level_undead_1_10)
	
	#Inventory Items
	#Monster Loot
	file.store_var(Inventory.Green_Slime)
	file.store_var(Inventory.Acid_Slime)
	file.store_var(Inventory.Poison_Slime)
	file.store_var(Inventory.Lava_Slime)
	file.store_var(Inventory.Aqua_Slime)
	file.store_var(Inventory.Magic_Slime)
	file.store_var(Inventory.Metallic_Slime)
	
	file.store_var(Inventory.Bone)
	file.store_var(Inventory.Skull)
	
	#Potions
	file.store_var(Inventory.minor_health_potion)
	file.store_var(Inventory.minor_mana_potion)
	file.store_var(Inventory.Acid_potion)
	
	#Weapons
	file.store_var(Inventory.Wooden_Sword)
	
	file.close()

func New_Game():
		# Reset Player Stats
	HP = 10
	MAX_HP = 10
	MP = 10
	MAX_MP = 10
	EN = 10
	MAX_EN = 10
	coin = 0
	Weapon = "None"
	Weapon_Type = "None"

	# Reset Attributes
	STR = 1
	DEX = 1
	AGI = 1
	VIT = 0
	END = 0
	INT = 1
	WIS = 0
	CHA = 1
	LUK = 1
	CTRL = 1

	# Reset Accuracy
	ACCURACY = 0

	# Reset Damage Values
	PHYSICAL_DMG = 0
	SHARP_DMG = 0
	ACID_DMG = 0
	MAGIC_DMG = 0
	WATER_DMG = 0
	EARTH_DMG = 0
	AIR_DMG = 0
	DARK_DMG = 0
	LIGHT_DMG = 0
	POISON_DMG = 0
	ELECTRIC_DMG = 0
	MIND_DMG = 0
	FIRE_DMG = 0
	DIVINE_DMG = 0
	TOTAL_DMG = 0
	
	#Reset weapon damage values
	SWORD_DMG = 0

	# Reset Defense Values
	PHYSICAL_DEF = 0
	WATER_DEF = 0
	TOTAL_DEF = 0

	# Reset Level and XP
	LVL = 1
	XP = 0
	XP_NXT = calculate_xp_needed(LVL)
	Allocation_points = 0
	
	# Time and Day
	Global.Time_of_day = 0
	Global.Day = 1
	
	#Quests
	Global.claire_quest = 0
	Global.claire_sub_quest = 0
	Global.lydia_quest = 0
	Global.lydia_sub_quest = 0
	Global.veronica_quest = 0
	Global.veronica_sub_quest = 0
	
	#NPC
	Global.claire = 0
	Global.lydia = 0
	Global.veronica = 0
	
	
	# Skills
	# Rest
	Skill.Rest_Unlocked = true
	Skill.Rest_LVL = 1
	Skill.Rest_XP = 0
	Skill.Rest_NXT_XP = Skill.calculate_xp_needed(Skill.Rest_LVL)
	
	# PushUp
	Skill.PushUp_Unlocked = false
	Skill.PushUp_LVL = 1
	Skill.PushUp_XP = 0
	Skill.PushUp_NXT_XP = Skill.calculate_xp_needed(Skill.PushUp_LVL)
	
	# Run
	Skill.Run_Unlocked = false
	Skill.Run_LVL = 1
	Skill.Run_XP = 0
	Skill.Run_NXT_XP = Skill.calculate_xp_needed(Skill.Run_LVL)

	# Study
	Skill.Study_Unlocked = false
	Skill.Study_LVL = 1
	Skill.Study_XP = 0
	Skill.Study_NXT_XP = Skill.calculate_xp_needed(Skill.Study_LVL)
	
	# Speech
	Skill.Speech_Unlocked = false
	Skill.Speech_LVL = 1
	Skill.Speech_XP = 0
	Skill.Speech_NXT_XP = Skill.calculate_xp_needed(Skill.Speech_LVL)

	# Punch
	Skill.Punch_Unlocked = true
	Skill.Punch_LVL = 1
	Skill.Punch_XP = 0
	Skill.Punch_NXT_XP = Skill.calculate_xp_needed(Skill.Punch_LVL)
	
	# Strong Punch
	Skill.Strong_Punch_Unlocked = false
	Skill.Strong_Punch_LVL = 1
	Skill.Strong_Punch_XP = 0
	Skill.Strong_Punch_NXT_XP = Skill.calculate_xp_needed(Skill.Strong_Punch_LVL)

	# Squat
	Skill.Squat_Unlocked = false
	Skill.Squat_LVL = 1
	Skill.Squat_XP = 0
	Skill.Squat_NXT_XP = Skill.calculate_xp_needed(Skill.Squat_LVL)
	
	#Physical Endurance
	Skill.Physical_Endurance_Unlocked = false
	Skill.Physical_Endurance_LVL = 1
	Skill.Physical_Endurance_XP = 0
	Skill.Physical_Endurance_NXT_XP = calculate_xp_needed(Skill.Physical_Endurance_LVL)
	
	#Kick
	Skill.Kick_Unlocked = false
	Skill.Kick_LVL = 1
	Skill.Kick_XP = 0
	Skill.Kick_NXT_XP = calculate_xp_needed(Skill.Kick_LVL)
	
	#Magic Blast
	Skill.Magic_Blast_Unlocked = false
	Skill.Magic_Blast_LVL = 1
	Skill.Magic_Blast_XP = 0
	Skill.Magic_Blast_NXT_XP = calculate_xp_needed(Skill.Magic_Blast_LVL)
	
	#Minor Regen skill data
	Skill.Minor_Regen_Unlocked = false
	Skill.Minor_Regen_LVL = 1
	Skill.Minor_Regen_XP = 0
	Skill.Minor_Regen_NXT_XP = calculate_xp_needed(Skill.Minor_Regen_LVL)
	
	# Lowly Mana Regen
	Skill.Lowly_Mana_Regen_Unlocked = false
	Skill.Lowly_Mana_Regen_LVL = 1
	Skill.Lowly_Mana_Regen_XP = 0
	Skill.Lowly_Mana_Regen_NXT_XP = Skill.calculate_xp_needed(Skill.Lowly_Mana_Regen_LVL)
	
	#Meditate
	Skill.Meditate_Unlocked = false
	Skill.Meditate_LVL = 1
	Skill.Meditate_XP = 0
	Skill.Meditate_NXT_XP = calculate_xp_needed(Skill.Meditate_LVL)
	
	#Shower
	Skill.Shower_Unlocked = false
	Skill.Shower_LVL = 1
	Skill.Shower_XP = 0
	Skill.Shower_NXT_XP = calculate_xp_needed(Skill.Shower_LVL)
	
	# **Potion Proficiency Skill**
	Skill.Potion_Proficiency_Unlocked = true
	Skill.Potion_Proficiency_LVL = 1
	Skill.Potion_Proficiency_XP = 0
	Skill.Potion_Proficiency_NXT_XP = calculate_xp_needed(Skill.Potion_Proficiency_LVL)
	
	# Sword Slash (New Game)
	Skill.Sword_Slash_Unlocked = false
	Skill.Sword_Slash_LVL = 1
	Skill.Sword_Slash_XP = 0
	Skill.Sword_Slash_NXT_XP = Skill.calculate_xp_needed(Skill.Sword_Slash_LVL)
	
	# Sword Mastery
	Skill.Sword_Mastery_Unlocked = false
	Skill.Sword_Mastery_LVL = 1
	Skill.Sword_Mastery_XP = 0
	Skill.Sword_Mastery_NXT_XP = Skill.calculate_xp_needed(Skill.Sword_Mastery_LVL)
	
	# **Health Potion Skill**
	Skill.Health_Potion_Unlocked = false
	Skill.Health_Potion_LVL = 1
	Skill.Health_Potion_XP = 0
	Skill.Health_Potion_NXT_XP = calculate_xp_needed(Skill.Health_Potion_LVL)
	
	# **Mana Potion Skill**
	Skill.Mana_Potion_Unlocked = false
	Skill.Mana_Potion_LVL = 1
	Skill.Mana_Potion_XP = 0
	Skill.Mana_Potion_NXT_XP = calculate_xp_needed(Skill.Mana_Potion_LVL)
	
	# **Acid Potion Skill**
	Skill.Acid_Potion_Unlocked = false
	Skill.Acid_Potion_LVL = 1
	Skill.Acid_Potion_XP = 0
	Skill.Acid_Potion_NXT_XP = calculate_xp_needed(Skill.Acid_Potion_LVL)
	
	# **Magic Seeker Skill**
	Skill.Magic_Seeker_Unlocked = false
	Skill.Magic_Seeker_LVL = 1
	Skill.Magic_Seeker_XP = 0
	Skill.Magic_Seeker_NXT_XP = calculate_xp_needed(Skill.Magic_Seeker_LVL)
	
	#Inventory Items
	#Monster Loot
	Inventory.Green_Slime = 0
	Inventory.Acid_Slime = 0
	Inventory.Poison_Slime = 0
	Inventory.Lava_Slime = 0
	Inventory.Aqua_Slime = 0
	Inventory.Magic_Slime = 0
	Inventory.Metallic_Slime = 0
	
	Inventory.Bone = 0
	Inventory.Skull = 0
	
	#Potions
	Inventory.minor_health_potion = 0
	Inventory.minor_mana_potion = 0
	Inventory.Acid_potion = 0
	
	#Weapons
	Inventory.Wooden_Sword = 0
	
	#Dungeon Datas
	DungeonData.lowest_level_slime_1_10 = true
	DungeonData.lowest_level_slime_11_20 = false
	DungeonData.lowest_level_slime_21_30 = false
	DungeonData.lowest_level_slime_31_40 = false
	DungeonData.lowest_level_slime_41_50 = false
	DungeonData.lowest_level_slime_51_60 = false
	DungeonData.lowest_level_slime_61_70 = false
	DungeonData.lowest_level_slime_71_80 = false
	DungeonData.lowest_level_slime_81_90 = false
	DungeonData.lowest_level_slime_91_100 = false
	
	DungeonData.lowest_level_undead_1_10 = false

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
				# Player Stats
		HP = file.get_var()
		MAX_HP = file.get_var()
		MP = file.get_var()
		MAX_MP = file.get_var()
		EN = file.get_var()
		MAX_EN = file.get_var()
		coin = file.get_var()
		Weapon = file.get_var()
		Weapon_Type = file.get_var()

		# Attributes
		STR = file.get_var()
		DEX = file.get_var()
		AGI = file.get_var()
		VIT = file.get_var()
		END = file.get_var()
		INT = file.get_var()
		WIS = file.get_var()
		CHA = file.get_var()
		LUK = file.get_var()
		CTRL = file.get_var()

		# Accuracy
		ACCURACY = file.get_var()

		# Damage Values
		PHYSICAL_DMG = file.get_var()
		SHARP_DMG = file.get_var()
		ACID_DMG = file.get_var()
		MAGIC_DMG = file.get_var()
		WATER_DMG = file.get_var()
		EARTH_DMG = file.get_var()
		AIR_DMG = file.get_var()
		DARK_DMG = file.get_var()
		LIGHT_DMG = file.get_var()
		POISON_DMG = file.get_var()
		ELECTRIC_DMG = file.get_var()
		MIND_DMG = file.get_var()
		FIRE_DMG = file.get_var()
		DIVINE_DMG = file.get_var()
		TOTAL_DMG = file.get_var()

		# Weapon damage values
		SWORD_DMG = file.get_var()


		# Defense Values
		PHYSICAL_DEF = file.get_var()
		WATER_DEF = file.get_var()
		TOTAL_DEF = file.get_var()

		# Level & XP
		LVL = file.get_var()
		XP = file.get_var()
		XP_NXT = file.get_var()
		Allocation_points = file.get_var()

		# Time & Day
		Global.Time_of_day = file.get_var()
		Global.Day = file.get_var()

		# Quests
		Global.claire_quest = file.get_var()
		Global.claire_sub_quest = file.get_var()
		Global.lydia_quest = file.get_var()
		Global.lydia_sub_quest = file.get_var()
		Global.veronica_quest = file.get_var()
		Global.veronica_sub_quest = file.get_var()

		
		# NPC
		Global.claire = file.get_var()
		Global.lydia = file.get_var()
		Global.veronica = file.get_var()

		# Skills

		# Rest
		Skill.Rest_Unlocked = file.get_var()
		Skill.Rest_LVL = file.get_var()
		Skill.Rest_XP = file.get_var()
		Skill.Rest_NXT_XP = file.get_var()

		# PushUp
		Skill.PushUp_Unlocked = file.get_var()
		Skill.PushUp_LVL = file.get_var()
		Skill.PushUp_XP = file.get_var()
		Skill.PushUp_NXT_XP = file.get_var()

		# Run
		Skill.Run_Unlocked = file.get_var()
		Skill.Run_LVL = file.get_var()
		Skill.Run_XP = file.get_var()
		Skill.Run_NXT_XP = file.get_var()


		# Study
		Skill.Study_Unlocked = file.get_var()
		Skill.Study_LVL = file.get_var()
		Skill.Study_XP = file.get_var()
		Skill.Study_NXT_XP = file.get_var()

		# Speech
		Skill.Speech_Unlocked = file.get_var()
		Skill.Speech_LVL = file.get_var()
		Skill.Speech_XP = file.get_var()
		Skill.Speech_NXT_XP = file.get_var()

		# Punch
		Skill.Punch_Unlocked = file.get_var()
		Skill.Punch_LVL = file.get_var()
		Skill.Punch_XP = file.get_var()
		Skill.Punch_NXT_XP = file.get_var()

		# Strong Punch
		Skill.Strong_Punch_Unlocked = file.get_var()
		Skill.Strong_Punch_LVL = file.get_var()
		Skill.Strong_Punch_XP = file.get_var()
		Skill.Strong_Punch_NXT_XP = file.get_var()

		# Squat
		Skill.Squat_Unlocked = file.get_var()
		Skill.Squat_LVL = file.get_var()
		Skill.Squat_XP = file.get_var()
		Skill.Squat_NXT_XP = file.get_var()

		# Physical Endurance
		Skill.Physical_Endurance_Unlocked = file.get_var()
		Skill.Physical_Endurance_LVL = file.get_var()
		Skill.Physical_Endurance_XP = file.get_var()
		Skill.Physical_Endurance_NXT_XP = file.get_var()

		# Kick
		Skill.Kick_Unlocked = file.get_var()
		Skill.Kick_LVL = file.get_var()
		Skill.Kick_XP = file.get_var()
		Skill.Kick_NXT_XP = file.get_var()

		# Magic Blast
		Skill.Magic_Blast_Unlocked = file.get_var()
		Skill.Magic_Blast_LVL = file.get_var()
		Skill.Magic_Blast_XP = file.get_var()
		Skill.Magic_Blast_NXT_XP = file.get_var()

		# Minor Regen
		Skill.Minor_Regen_Unlocked = file.get_var()
		Skill.Minor_Regen_LVL = file.get_var()
		Skill.Minor_Regen_XP = file.get_var()
		Skill.Minor_Regen_NXT_XP = file.get_var()

		
		# Lowly Mana Regen
		Skill.Lowly_Mana_Regen_Unlocked = file.get_var()
		Skill.Lowly_Mana_Regen_LVL = file.get_var()
		Skill.Lowly_Mana_Regen_XP = file.get_var()
		Skill.Lowly_Mana_Regen_NXT_XP = file.get_var()

		# Meditate
		Skill.Meditate_Unlocked = file.get_var()
		Skill.Meditate_LVL = file.get_var()
		Skill.Meditate_XP = file.get_var()
		Skill.Meditate_NXT_XP = file.get_var()

		# Shower
		Skill.Shower_Unlocked = file.get_var()
		Skill.Shower_LVL = file.get_var()
		Skill.Shower_XP = file.get_var()
		Skill.Shower_NXT_XP = file.get_var()

		# Magic Seeker
		Skill.Magic_Seeker_Unlocked = file.get_var()
		Skill.Magic_Seeker_LVL = file.get_var()
		Skill.Magic_Seeker_XP = file.get_var()
		Skill.Magic_Seeker_NXT_XP = file.get_var()

		
		# Potion Proficiency
		Skill.Potion_Proficiency_Unlocked = file.get_var()
		Skill.Potion_Proficiency_LVL = file.get_var()
		Skill.Potion_Proficiency_XP = file.get_var()
		Skill.Potion_Proficiency_NXT_XP = file.get_var()
		
		# Sword Slash Load
		Skill.Sword_Slash_Unlocked = file.get_var()
		Skill.Sword_Slash_LVL = file.get_var()
		Skill.Sword_Slash_XP = file.get_var()
		Skill.Sword_Slash_NXT_XP = file.get_var()
		
		# Sword Mastery
		Skill.Sword_Mastery_Unlocked = file.get_var()
		Skill.Sword_Mastery_LVL = file.get_var()
		Skill.Sword_Mastery_XP = file.get_var()
		Skill.Sword_Mastery_NXT_XP = file.get_var()

		# Health Potion
		Skill.Health_Potion_Unlocked = file.get_var()
		Skill.Health_Potion_LVL = file.get_var()
		Skill.Health_Potion_XP = file.get_var()
		Skill.Health_Potion_NXT_XP = file.get_var()

		# Mana Potion
		Skill.Mana_Potion_Unlocked = file.get_var()
		Skill.Mana_Potion_LVL = file.get_var()
		Skill.Mana_Potion_XP = file.get_var()
		Skill.Mana_Potion_NXT_XP = file.get_var()

		# Acid Potion
		Skill.Acid_Potion_Unlocked = file.get_var()
		Skill.Acid_Potion_LVL = file.get_var()
		Skill.Acid_Potion_XP = file.get_var()
		Skill.Acid_Potion_NXT_XP = file.get_var()

		
		# DungeonData
		DungeonData.lowest_level_slime_1_10 = file.get_var()
		DungeonData.lowest_level_slime_11_20 = file.get_var()
		DungeonData.lowest_level_slime_21_30 = file.get_var()
		DungeonData.lowest_level_slime_31_40 = file.get_var()
		DungeonData.lowest_level_slime_41_50 = file.get_var()
		DungeonData.lowest_level_slime_51_60 = file.get_var()
		DungeonData.lowest_level_slime_61_70 = file.get_var()
		DungeonData.lowest_level_slime_71_80 = file.get_var()
		DungeonData.lowest_level_slime_81_90 = file.get_var()
		DungeonData.lowest_level_slime_91_100 = file.get_var()
		
		DungeonData.lowest_level_undead_1_10 = file.get_var()

		# Inventory Items
		# Monster Loot
		Inventory.Green_Slime = file.get_var()
		Inventory.Acid_Slime = file.get_var()
		Inventory.Poison_Slime = file.get_var()
		Inventory.Lava_Slime = file.get_var()
		Inventory.Aqua_Slime = file.get_var()
		Inventory.Magic_Slime = file.get_var()
		Inventory.Metallic_Slime = file.get_var()
		
		Inventory.Bone = file.get_var()
		Inventory.Skull = file.get_var()

		# Potions
		Inventory.minor_health_potion = file.get_var()
		Inventory.minor_mana_potion = file.get_var()
		Inventory.Acid_potion = file.get_var()

		# Weapons
		Inventory.Wooden_Sword = file.get_var()
		file.close()
		
	else:
		print("No save file found.")

