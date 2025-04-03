extends Node

var save_path = "user://Life_At_Level.save"

var LVL = 1
var XP = 0
var XP_NXT = calculate_xp_needed(LVL)
var Allocation_points = 0

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

func Health_Check():
	if HP < 0:
		HP = 0
	elif HP > MAX_HP:
		HP = MAX_HP

func compute_total_dmg():
	TOTAL_DMG = (
		PHYSICAL_DMG + SHARP_DMG + MAGIC_DMG + WATER_DMG + EARTH_DMG + 
		AIR_DMG + DARK_DMG + LIGHT_DMG + POISON_DMG + ELECTRIC_DMG + 
		MIND_DMG + FIRE_DMG + DIVINE_DMG
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

	# Punch
	file.store_var(Skill.Punch_Unlocked)
	file.store_var(Skill.Punch_LVL)
	file.store_var(Skill.Punch_XP)
	file.store_var(Skill.Punch_NXT_XP)

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

func New_Game():
		# Reset Player Stats
	HP = 10
	MAX_HP = 10
	MP = 10
	MAX_MP = 10
	EN = 10
	MAX_EN = 10

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

	# Punch
	Skill.Punch_Unlocked = true
	Skill.Punch_LVL = 1
	Skill.Punch_XP = 0
	Skill.Punch_NXT_XP = Skill.calculate_xp_needed(Skill.Punch_LVL)

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
	
	#Meditate
	Skill.Meditate_Unlocked = true
	Skill.Meditate_LVL = 1
	Skill.Meditate_XP = 0
	Skill.Meditate_NXT_XP = calculate_xp_needed(Skill.Meditate_LVL)
	
	#Inventory Items
	Inventory.Green_Slime = 0
	Inventory.Acid_Slime = 0
	Inventory.Poison_Slime = 0
	Inventory.Lava_Slime = 0
	Inventory.Aqua_Slime = 0

	
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

		# Punch
		Skill.Punch_Unlocked = file.get_var(Skill.Punch_Unlocked)
		Skill.Punch_LVL = file.get_var(Skill.Punch_LVL)
		Skill.Punch_XP = file.get_var(Skill.Punch_XP)
		Skill.Punch_NXT_XP = file.get_var(Skill.Punch_NXT_XP)

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
		
		#Meditate
		Skill.Meditate_Unlocked = file.get_var(Skill.Meditate_Unlocked)
		Skill.Meditate_LVL = file.get_var(Skill.Meditate_LVL)
		Skill.Meditate_XP = file.get_var(Skill.Meditate_XP)
		Skill.Meditate_NXT_XP = file.get_var(Skill.Meditate_NXT_XP)
		
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
		
	else:
		print("No save file found.")

