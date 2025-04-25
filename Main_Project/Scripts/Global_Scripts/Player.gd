extends Node

var save_path = "user://Life_At_Level.save"

var LVL = 1
var XP = 0
var XP_NXT = calculate_xp_needed(LVL)
var Allocation_points = 0

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
	
	#Inventory Items
	file.store_var(Inventory.Green_Slime)
	file.store_var(Inventory.Acid_Slime)
	file.store_var(Inventory.Poison_Slime)
	file.store_var(Inventory.Lava_Slime)
	file.store_var(Inventory.Aqua_Slime)
	file.store_var(Inventory.Magic_Slime)
	file.store_var(Inventory.Metallic_Slime)
	
	file.store_var(Inventory.minor_health_potion)
	file.store_var(Inventory.minor_mana_potion)
	file.store_var(Inventory.Acid_potion)
	
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
	
	# Skills
	# Rest
	Skill.Rest_Unlocked = true
	Skill.Rest_LVL = 1
	Skill.Rest_XP = 0
	Skill.Rest_NXT_XP = Skill.calculate_xp_needed(Skill.Rest_LVL)
	
	# PushUp
	Skill.PushUp_Unlocked = true
	Skill.PushUp_LVL = 1
	Skill.PushUp_XP = 0
	Skill.PushUp_NXT_XP = Skill.calculate_xp_needed(Skill.PushUp_LVL)
	
	# Run
	Skill.Run_Unlocked = true
	Skill.Run_LVL = 1
	Skill.Run_XP = 0
	Skill.Run_NXT_XP = Skill.calculate_xp_needed(Skill.Run_LVL)

	# Study
	Skill.Study_Unlocked = true
	Skill.Study_LVL = 1
	Skill.Study_XP = 0
	Skill.Study_NXT_XP = Skill.calculate_xp_needed(Skill.Study_LVL)
	
	# Speech
	Skill.Speech_Unlocked = true
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
	Skill.Squat_Unlocked = true
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
	Skill.Meditate_Unlocked = true
	Skill.Meditate_LVL = 1
	Skill.Meditate_XP = 0
	Skill.Meditate_NXT_XP = calculate_xp_needed(Skill.Meditate_LVL)
	
	#Shower
	Skill.Shower_Unlocked = true
	Skill.Shower_LVL = 1
	Skill.Shower_XP = 0
	Skill.Shower_NXT_XP = calculate_xp_needed(Skill.Shower_LVL)
	
	# **Potion Proficiency Skill**
	Skill.Potion_Proficiency_Unlocked = true
	Skill.Potion_Proficiency_LVL = 1
	Skill.Potion_Proficiency_XP = 0
	Skill.Potion_Proficiency_NXT_XP = calculate_xp_needed(Skill.Potion_Proficiency_LVL)
	
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
	Inventory.Green_Slime = 0
	Inventory.Acid_Slime = 0
	Inventory.Poison_Slime = 0
	Inventory.Lava_Slime = 0
	Inventory.Aqua_Slime = 0
	Inventory.Magic_Slime = 0
	Inventory.Metallic_Slime = 0
	
	Inventory.minor_health_potion = 0
	Inventory.minor_mana_potion = 0
	Inventory.Acid_potion = 0

	
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

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
				# Player Stats
		HP = file.get_var(HP)
		MAX_HP = file.get_var(MAX_HP)
		MP = file.get_var(MP)
		MAX_MP = file.get_var(MAX_MP)
		EN = file.get_var(EN)
		MAX_EN = file.get_var(MAX_EN)
		coin = file.get_var(coin)

		# Attributes
		STR = file.get_var(STR)
		DEX = file.get_var(DEX)
		AGI = file.get_var(AGI)
		VIT = file.get_var(VIT)
		END = file.get_var(END)
		INT = file.get_var(INT)
		WIS = file.get_var(WIS)
		CHA = file.get_var(CHA)
		LUK = file.get_var(LUK)
		CTRL = file.get_var(CTRL)

		# Accuracy
		ACCURACY = file.get_var(ACCURACY)

		# Damage Values
		PHYSICAL_DMG = file.get_var(PHYSICAL_DMG)
		SHARP_DMG = file.get_var(SHARP_DMG)
		ACID_DMG = file.get_var(ACID_DMG)
		MAGIC_DMG = file.get_var(MAGIC_DMG)
		WATER_DMG = file.get_var(WATER_DMG)
		EARTH_DMG = file.get_var(EARTH_DMG)
		AIR_DMG = file.get_var(AIR_DMG)
		DARK_DMG = file.get_var(DARK_DMG)
		LIGHT_DMG = file.get_var(LIGHT_DMG)
		POISON_DMG = file.get_var(POISON_DMG)
		ELECTRIC_DMG = file.get_var(ELECTRIC_DMG)
		MIND_DMG = file.get_var(MIND_DMG)
		FIRE_DMG = file.get_var(FIRE_DMG)
		DIVINE_DMG = file.get_var(DIVINE_DMG)
		TOTAL_DMG = file.get_var(TOTAL_DMG)

		# Defense Values
		PHYSICAL_DEF = file.get_var(PHYSICAL_DEF)
		WATER_DEF = file.get_var(WATER_DEF)
		TOTAL_DEF = file.get_var(TOTAL_DEF)
		

		# Level & XP
		LVL = file.get_var(LVL)
		XP = file.get_var(XP)
		XP_NXT = file.get_var(XP_NXT)
		Allocation_points = file.get_var(Allocation_points)

		# Time & Day
		Global.Time_of_day = file.get_var(Global.Time_of_day)
		Global.Day = file.get_var(Global.Day)
		
		#Quests
		Global.claire_quest = file.get_var(Global.claire_quest)

		# Skills
		# Rest
		Skill.Rest_Unlocked = file.get_var(Skill.Rest_Unlocked)
		Skill.Rest_LVL = file.get_var(Skill.Rest_LVL)
		Skill.Rest_XP = file.get_var(Skill.Rest_XP)
		Skill.Rest_NXT_XP = file.get_var(Skill.Rest_NXT_XP)

		# PushUp
		Skill.PushUp_Unlocked = file.get_var(Skill.PushUp_Unlocked)
		Skill.PushUp_LVL = file.get_var(Skill.PushUp_LVL)
		Skill.PushUp_XP = file.get_var(Skill.PushUp_XP)
		Skill.PushUp_NXT_XP = file.get_var(Skill.PushUp_NXT_XP)

		# Run
		Skill.Run_Unlocked = file.get_var(Skill.Run_Unlocked)
		Skill.Run_LVL = file.get_var(Skill.Run_LVL)
		Skill.Run_XP = file.get_var(Skill.Run_XP)
		Skill.Run_NXT_XP = file.get_var(Skill.Run_NXT_XP)

		# Study
		Skill.Study_Unlocked = file.get_var(Skill.Study_Unlocked)
		Skill.Study_LVL = file.get_var(Skill.Study_LVL)
		Skill.Study_XP = file.get_var(Skill.Study_XP)
		Skill.Study_NXT_XP = file.get_var(Skill.Study_NXT_XP)
		
		# Speech
		Skill.Speech_Unlocked = file.get_var(Skill.Speech_Unlocked)
		Skill.Speech_LVL = file.get_var(Skill.Speech_LVL)
		Skill.Speech_XP = file.get_var(Skill.Speech_XP)
		Skill.Speech_NXT_XP = file.get_var(Skill.Speech_NXT_XP)

		# Punch
		Skill.Punch_Unlocked = file.get_var(Skill.Punch_Unlocked)
		Skill.Punch_LVL = file.get_var(Skill.Punch_LVL)
		Skill.Punch_XP = file.get_var(Skill.Punch_XP)
		Skill.Punch_NXT_XP = file.get_var(Skill.Punch_NXT_XP)
		
		# Strong Punch
		Skill.Strong_Punch_Unlocked = file.get_var(Skill.Strong_Punch_Unlocked)
		Skill.Strong_Punch_LVL = file.get_var(Skill.Strong_Punch_LVL)
		Skill.Strong_Punch_XP = file.get_var(Skill.Strong_Punch_XP)
		Skill.Strong_Punch_NXT_XP = file.get_var(Skill.Strong_Punch_NXT_XP)


		# Squat
		Skill.Squat_Unlocked = file.get_var(Skill.Squat_Unlocked)
		Skill.Squat_LVL = file.get_var(Skill.Squat_LVL)
		Skill.Squat_XP = file.get_var(Skill.Squat_XP)
		Skill.Squat_NXT_XP = file.get_var(Skill.Squat_NXT_XP)
		
		#Physical Endurance
		Skill.Physical_Endurance_Unlocked = file.get_var(Skill.Physical_Endurance_Unlocked)
		Skill.Physical_Endurance_LVL = file.get_var(Skill.Physical_Endurance_LVL)
		Skill.Physical_Endurance_XP = file.get_var(Skill.Physical_Endurance_XP)
		Skill.Physical_Endurance_NXT_XP = file.get_var(Skill.Physical_Endurance_NXT_XP)
		
		#Kick
		Skill.Kick_Unlocked = file.get_var(Skill.Kick_Unlocked)
		Skill.Kick_LVL = file.get_var(Skill.Kick_LVL)
		Skill.Kick_XP = file.get_var(Skill.Kick_XP)
		Skill.Kick_NXT_XP = file.get_var(Skill.Kick_NXT_XP)
		
		#Magic Blast
		Skill.Magic_Blast_Unlocked = file.get_var(Skill.Magic_Blast_Unlocked)
		Skill.Magic_Blast_LVL = file.get_var(Skill.Magic_Blast_LVL)
		Skill.Magic_Blast_XP = file.get_var(Skill.Magic_Blast_XP)
		Skill.Magic_Blast_NXT_XP = file.get_var(Skill.Magic_Blast_NXT_XP)
		
		#Minor Regen
		Skill.Minor_Regen_Unlocked = file.get_var(Skill.Minor_Regen_Unlocked)
		Skill.Minor_Regen_LVL = file.get_var(Skill.Minor_Regen_LVL)
		Skill.Minor_Regen_XP = file.get_var(Skill.Minor_Regen_XP)
		Skill.Minor_Regen_NXT_XP = file.get_var(Skill.Minor_Regen_NXT_XP)
		
		# Lowly Mana Regen
		Skill.Lowly_Mana_Regen_Unlocked = file.get_var(Skill.Lowly_Mana_Regen_Unlocked)
		Skill.Lowly_Mana_Regen_LVL = file.get_var(Skill.Lowly_Mana_Regen_LVL)
		Skill.Lowly_Mana_Regen_XP = file.get_var(Skill.Lowly_Mana_Regen_XP)
		Skill.Lowly_Mana_Regen_NXT_XP = file.get_var(Skill.Lowly_Mana_Regen_NXT_XP)
		
		#Meditate
		Skill.Meditate_Unlocked = file.get_var(Skill.Meditate_Unlocked)
		Skill.Meditate_LVL = file.get_var(Skill.Meditate_LVL)
		Skill.Meditate_XP = file.get_var(Skill.Meditate_XP)
		Skill.Meditate_NXT_XP = file.get_var(Skill.Meditate_NXT_XP)
		
		#Shower
		Skill.Shower_Unlocked = file.get_var(Skill.Shower_Unlocked)
		Skill.Shower_LVL = file.get_var(Skill.Shower_LVL)
		Skill.Shower_XP = file.get_var(Skill.Shower_XP)
		Skill.Shower_NXT_XP = file.get_var(Skill.Shower_NXT_XP)
		
		#Magic Seeker
		Skill.Magic_Seeker_Unlocked = file.get_var(Skill.Magic_Seeker_Unlocked)
		Skill.Magic_Seeker_LVL = file.get_var(Skill.Magic_Seeker_LVL)
		Skill.Magic_Seeker_XP = file.get_var(Skill.Magic_Seeker_XP)
		Skill.Magic_Seeker_NXT_XP = file.get_var(Skill.Magic_Seeker_NXT_XP)
		
		# Potion Proficiency
		Skill.Potion_Proficiency_Unlocked = file.get_var(Skill.Potion_Proficiency_Unlocked)
		Skill.Potion_Proficiency_LVL = file.get_var(Skill.Potion_Proficiency_LVL)
		Skill.Potion_Proficiency_XP = file.get_var(Skill.Potion_Proficiency_XP)
		Skill.Potion_Proficiency_NXT_XP = file.get_var(Skill.Potion_Proficiency_NXT_XP)

		# Health Potion
		Skill.Health_Potion_Unlocked = file.get_var(Skill.Health_Potion_Unlocked)
		Skill.Health_Potion_LVL = file.get_var(Skill.Health_Potion_LVL)
		Skill.Health_Potion_XP = file.get_var(Skill.Health_Potion_XP)
		Skill.Health_Potion_NXT_XP = file.get_var(Skill.Health_Potion_NXT_XP)
		
		# Mana Potion
		Skill.Mana_Potion_Unlocked = file.get_var(Skill.Mana_Potion_Unlocked)
		Skill.Mana_Potion_LVL = file.get_var(Skill.Mana_Potion_LVL)
		Skill.Mana_Potion_XP = file.get_var(Skill.Mana_Potion_XP)
		Skill.Mana_Potion_NXT_XP = file.get_var(Skill.Mana_Potion_NXT_XP)
		
		# Acid Potion
		Skill.Acid_Potion_Unlocked = file.get_var(Skill.Acid_Potion_Unlocked)
		Skill.Acid_Potion_LVL = file.get_var(Skill.Acid_Potion_LVL)
		Skill.Acid_Potion_XP = file.get_var(Skill.Acid_Potion_XP)
		Skill.Acid_Potion_NXT_XP = file.get_var(Skill.Acid_Potion_NXT_XP)
		
		#DungeonData
		DungeonData.lowest_level_slime_1_10 = file.get_var(DungeonData.lowest_level_slime_1_10)
		DungeonData.lowest_level_slime_11_20 = file.get_var(DungeonData.lowest_level_slime_11_20)
		DungeonData.lowest_level_slime_21_30 = file.get_var(DungeonData.lowest_level_slime_21_30)
		DungeonData.lowest_level_slime_31_40 = file.get_var(DungeonData.lowest_level_slime_31_40)
		DungeonData.lowest_level_slime_41_50 = file.get_var(DungeonData.lowest_level_slime_41_50)
		DungeonData.lowest_level_slime_51_60 = file.get_var(DungeonData.lowest_level_slime_51_60)
		DungeonData.lowest_level_slime_61_70 = file.get_var(DungeonData.lowest_level_slime_61_70)
		DungeonData.lowest_level_slime_71_80 = file.get_var(DungeonData.lowest_level_slime_71_80)
		DungeonData.lowest_level_slime_81_90 = file.get_var(DungeonData.lowest_level_slime_81_90)
		DungeonData.lowest_level_slime_91_100 = file.get_var(DungeonData.lowest_level_slime_91_100)

		
		#Inventory Items
		Inventory.Green_Slime = file.get_var(Inventory.Green_Slime)
		Inventory.Acid_Slime = file.get_var(Inventory.Acid_Slime)
		Inventory.Poison_Slime = file.get_var(Inventory.Poison_Slime)
		Inventory.Lava_Slime = file.get_var(Inventory.Lava_Slime)
		Inventory.Aqua_Slime = file.get_var(Inventory.Aqua_Slime)
		Inventory.Magic_Slime = file.get_var(Inventory.Magic_Slime)
		Inventory.Metallic_Slime = file.get_var(Inventory.Metallic_Slime)
		
		Inventory.minor_health_potion = file.get_var(Inventory.minor_health_potion)
		Inventory.minor_mana_potion = file.get_var(Inventory.minor_mana_potion)
		Inventory.Acid_potion = file.get_var(Inventory.Acid_potion)
		
		file.close()
		
	else:
		print("No save file found.")

