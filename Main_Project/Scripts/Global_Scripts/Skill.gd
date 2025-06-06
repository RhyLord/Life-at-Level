extends Node

#Func to calculate NXT_XP Neeeded
func calculate_xp_needed(level: int) -> int:
	return 100 * (level * level)

func level_up_skill(skill_xp: String, skill_lvl: String, skill_nxt_xp: String, stat_gain_func = null):
	while get(skill_xp) >= get(skill_nxt_xp):
		set(skill_xp, get(skill_xp) - get(skill_nxt_xp))
		set(skill_lvl, get(skill_lvl) + 1)
		set(skill_nxt_xp, calculate_xp_needed(get(skill_lvl)))
		if stat_gain_func:
			stat_gain_func.call()

#Rest Skill
var Rest_Unlocked = true
var Rest_LVL = 1
var Rest_XP = 0
var Rest_NXT_XP = calculate_xp_needed(Rest_LVL)

func Off_Combat_Rest_XP():
	var xp_gain = ceil(1.5 * (Player.MAX_HP + Player.MAX_MP + Player.MAX_EN))
	Rest_XP += xp_gain
	level_up_skill("Rest_XP", "Rest_LVL", "Rest_NXT_XP")
	
func Off_Combat_Rest():
	var restore_amount = ceil((100 * Rest_LVL) + (0.25 * Player.MAX_HP) + (0.25 * Player.MAX_MP) + (0.25 * Player.MAX_EN))
	Player.HP = min(Player.HP + restore_amount, Player.MAX_HP)
	Player.MP = min(Player.MP + restore_amount, Player.MAX_MP)
	Player.EN = min(Player.EN + restore_amount, Player.MAX_EN)
	Global.cycle_time()
	Off_Combat_Rest_XP()
	
func Combat_Rest_XP():
	var xp_gain = ceil(2.5 * Player.MAX_EN)
	Rest_XP += xp_gain
	level_up_skill("Rest_XP", "Rest_LVL", "Rest_NXT_XP")
	
func Combat_Rest():
	var restore_amount = (10 * Rest_LVL) + Player.END
	Player.EN = min(Player.EN + restore_amount, Player.MAX_EN)
	PreBattleData.description_txt = "You have restored [color=purple]" + str(restore_amount) + "[/color] EN"
	Combat_Rest_XP()

# Push-Up Skill
var PushUp_Unlocked = false
var PushUp_LVL = 1
var PushUp_XP = 0
var PushUp_NXT_XP = calculate_xp_needed(PushUp_LVL)

func PushUp_stat_gain():
	Player.STR += 1 

func Active_PushUp_XP():
	var xp_gain = (10 * PushUp_LVL) + Player.MAX_EN
	PushUp_XP += xp_gain
	level_up_skill("PushUp_XP", "PushUp_LVL", "PushUp_NXT_XP", PushUp_stat_gain)

func Active_PushUp():
	var en_cost = ceil(0.25 * Player.MAX_EN)
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_PushUp_XP()

#Run Skill		
var Run_Unlocked = false
var Run_LVL = 1
var Run_XP = 0
var Run_NXT_XP = calculate_xp_needed(Run_LVL)

func Run_stat_gain():
	Player.MAX_EN += 10

func Active_Run_XP():
	var xp_gain = (10 * Run_LVL) + (Player.MAX_EN)
	Run_XP += xp_gain
	level_up_skill("Run_XP", "Run_LVL", "Run_NXT_XP", Run_stat_gain)
	
func Active_Run():
	var en_cost = ceil(0.25 * Player.MAX_EN)
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_Run_XP()
		
# **Study Skill**		
var Study_Unlocked = false
var Study_LVL = 1
var Study_XP = 0
var Study_NXT_XP = calculate_xp_needed(Study_LVL)

func Study_stat_gain():
	Player.INT += 1
	
func Active_Study_XP():
	var xp_gain = 25 * Player.INT  
	Study_XP += xp_gain
	level_up_skill("Study_XP", "Study_LVL", "Study_NXT_XP", Study_stat_gain)

func Active_Study():
	var en_cost = ceil(0.05 * Player.MAX_EN)   # Consumes 5% of EN
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_Study_XP()
			
# **Speech Skill**		
var Speech_Unlocked = false
var Speech_LVL = 1
var Speech_XP = 0
var Speech_NXT_XP = calculate_xp_needed(Speech_LVL)

func Speech_stat_gain():
	Player.CHA += 1
	
func Active_Speech_XP():
	if Player.EN >= (Player.MAX_EN * 0.05):
		Player.EN -= Player.MAX_EN * 0.05
		Global.cycle_time()
		
		var xp_gain = 50 + (25 * Player.CHA)
		Speech_XP += xp_gain
		level_up_skill("Speech_XP", "Speech_LVL", "Speech_NXT_XP", Speech_stat_gain)


# **Punch Skill**		
var Punch_Unlocked = true
var Punch_LVL = 1
var Punch_XP = 0
var Punch_NXT_XP = calculate_xp_needed(Punch_LVL)

func Punch_XP_gain():
	var xp_gain = (50 * Punch_LVL) + (10 * Player.STR)  # XP formula
	Punch_XP += xp_gain
	

func Punch():
	var en_cost = 5  # Active: Consumes 5 EN
	if Player.EN >= en_cost:
		Player.EN -= en_cost  # Reduce EN
	
		Player.PHYSICAL_DMG = (1 * Punch_LVL) + (1 * Player.STR)

		Punch_XP_gain()
		level_up_skill("Punch_XP", "Punch_LVL", "Punch_NXT_XP")

# **Squat Skill**
var Squat_Unlocked = false
var Squat_LVL = 1
var Squat_XP = 0
var Squat_NXT_XP = calculate_xp_needed(Squat_LVL)

func Squat_stat_gain():
	Player.MAX_HP += 10

func Active_Squat_XP():
	var xp_gain = (Squat_LVL * 10) + Player.MAX_EN
	Squat_XP += xp_gain
	level_up_skill("Squat_XP", "Squat_LVL", "Squat_NXT_XP", Squat_stat_gain)

func Active_Squat():
	var en_cost = ceil(0.25 * Player.MAX_EN)
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_Squat_XP()
		
# **Physical_Endurance Skill**
var Physical_Endurance_Unlocked = false
var Physical_Endurance_LVL = 1
var Physical_Endurance_XP = 0
var Physical_Endurance_NXT_XP = calculate_xp_needed(Physical_Endurance_LVL)

func Physical_Endurance_stat_gain():
	Player.PHYSICAL_DEF += 1

func Active_Physical_Endurance_XP(enemy_phy_dmg):
	var xp_gain = (enemy_phy_dmg * Physical_Endurance_LVL)
	Physical_Endurance_XP += xp_gain
	level_up_skill("Physical_Endurance_XP", "Physical_Endurance_LVL", "Physical_Endurance_NXT_XP", Physical_Endurance_stat_gain)

# **Kick Skill**		
var Kick_Unlocked = false
var Kick_LVL = 1
var Kick_XP = 0
var Kick_NXT_XP = calculate_xp_needed(Kick_LVL)

func Kick_XP_gain():
	var xp_gain = (50 * Kick_LVL) + (10 * Player.STR)
	Kick_XP += xp_gain
	
func Kick():
	var en_cost = 25
	if Player.EN >= en_cost:
		Player.EN -= en_cost
	
		Player.PHYSICAL_DMG = (1 * Kick_LVL) + (2 * Player.STR)

		Kick_XP_gain()
		level_up_skill("Kick_XP", "Kick_LVL", "Kick_NXT_XP")

# **Strong Punch Skill**		
var Strong_Punch_Unlocked = false
var Strong_Punch_LVL = 1
var Strong_Punch_XP = 0
var Strong_Punch_NXT_XP = calculate_xp_needed(Strong_Punch_LVL)

func Strong_Punch_XP_gain():
	var xp_gain = (75 * Strong_Punch_LVL) + (15 * Player.STR)
	Strong_Punch_XP += xp_gain

func Strong_Punch():
	var en_cost = 100
	if Player.EN >= en_cost:
		Player.EN -= en_cost

		Player.PHYSICAL_DMG = (5 * Strong_Punch_LVL) + (5 * Player.STR)

		Strong_Punch_XP_gain()
		level_up_skill("Strong_Punch_XP", "Strong_Punch_LVL", "Strong_Punch_NXT_XP")

#Minor Regen Skill
var Minor_Regen_Unlocked = false
var Minor_Regen_LVL = 1
var Minor_Regen_XP = 0
var Minor_Regen_NXT_XP = calculate_xp_needed(Minor_Regen_LVL)

func Active_Minor_Regen():
	var en_cost = 50
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		var restore_amount = (10 * Minor_Regen_LVL) + Player.VIT
		Player.HP += restore_amount
		Player.Health_Check()
		PreBattleData.description_txt = "You have restored [color=#90EE90]" + str(restore_amount) + "[/color] HP"
		
		var xp_gain = ceil((25 * Player.VIT) + (Minor_Regen_LVL * 25))
		Minor_Regen_XP += xp_gain
		level_up_skill("Minor_Regen_XP", "Minor_Regen_LVL", "Minor_Regen_NXT_XP")
	

# Lowly Mana Regen Skill
var Lowly_Mana_Regen_Unlocked = false
var Lowly_Mana_Regen_LVL = 1
var Lowly_Mana_Regen_XP = 0
var Lowly_Mana_Regen_NXT_XP = calculate_xp_needed(Lowly_Mana_Regen_LVL)

func Active_Lowly_Mana_Regen():
	var en_cost = 50
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		var restore_amount = (5 * Lowly_Mana_Regen_LVL) + Player.WIS
		Player.MP += restore_amount
		Player.Mana_Check()
		PreBattleData.description_txt = "You have restored [color=#ADD8E6]" + str(restore_amount) + "[/color] MP"
		var xp_gain = ceil((25 * Player.WIS) + (Lowly_Mana_Regen_LVL * 25))
		Lowly_Mana_Regen_XP += xp_gain
		level_up_skill("Lowly_Mana_Regen_XP", "Lowly_Mana_Regen_LVL", "Lowly_Mana_Regen_NXT_XP")



# **Magic Blast Skill**		
var Magic_Blast_Unlocked = false
var Magic_Blast_LVL = 1
var Magic_Blast_XP = 0
var Magic_Blast_NXT_XP = calculate_xp_needed(Magic_Blast_LVL)

func Magic_Blast_XP_gain():
	var xp_gain = (100 * Magic_Blast_LVL) + (10 * Player.INT)
	Magic_Blast_XP += xp_gain
	

func Active_Magic_Blast():
	var mp_cost = 50
	if Player.MP >= mp_cost:
		Player.MP -= mp_cost
	
		Player.MAGIC_DMG = (5 * Magic_Blast_LVL) + (5 * Player.INT)

		Magic_Blast_XP_gain()
		level_up_skill("Magic_Blast_XP", "Magic_Blast_LVL", "Magic_Blast_NXT_XP")

# **Meditate Skill**
var Meditate_Unlocked = false
var Meditate_LVL = 1
var Meditate_XP = 0
var Meditate_NXT_XP = calculate_xp_needed(Meditate_LVL)

func Meditate_stat_gain():
	Player.MAX_MP += 10

func Active_Meditate_XP():
	var xp_gain = (10 * Meditate_LVL) + Player.MAX_MP
	Meditate_XP += xp_gain
	level_up_skill("Meditate_XP", "Meditate_LVL", "Meditate_NXT_XP", Meditate_stat_gain)

func Active_Meditate():
	var en_cost = ceil(0.25 * Player.MAX_EN)  # Consumes 25% of MAX_EN
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_Meditate_XP()

# **Shower Skill**
var Shower_Unlocked = false
var Shower_LVL = 1
var Shower_XP = 0
var Shower_NXT_XP = calculate_xp_needed(Shower_LVL)

func Shower_stat_gain():
	Player.WATER_DEF += 1
	
func Active_Shower_XP():
	var xp_gain = 50 + ((0.5 * Player.MAX_HP) * Shower_LVL)
	Shower_XP += xp_gain
	level_up_skill("Shower_XP", "Shower_LVL", "Shower_NXT_XP", Shower_stat_gain)

func Active_Shower():
	var restore_amount = ceil((100 * Shower_LVL) + (0.15 * Player.MAX_HP) + (0.15 * Player.MAX_MP) + (0.15 * Player.MAX_EN))
	Player.HP = min(Player.HP + restore_amount, Player.MAX_HP)
	Player.MP = min(Player.MP + restore_amount, Player.MAX_MP)
	Player.EN = min(Player.EN + restore_amount, Player.MAX_EN)
	Global.cycle_time()
	Active_Shower_XP()

# **Potion Proficiency Skill**
var Potion_Proficiency_Unlocked = true
var Potion_Proficiency_LVL = 1
var Potion_Proficiency_XP = 0
var Potion_Proficiency_NXT_XP = calculate_xp_needed(Potion_Proficiency_LVL)

func Gain_Potion_Proficiency_XP():
	var xp_gain = 50 + (Player.DEX * Potion_Proficiency_LVL)
	Potion_Proficiency_XP += xp_gain
	level_up_skill("Potion_Proficiency_XP", "Potion_Proficiency_LVL", "Potion_Proficiency_NXT_XP")

# Sword Mastery Skill
var Sword_Mastery_Unlocked = false
var Sword_Mastery_LVL = 1
var Sword_Mastery_XP = 0
var Sword_Mastery_NXT_XP = calculate_xp_needed(Sword_Mastery_LVL)

func Gain_Sword_Mastery_XP():
	var xp_gain = (25 + (Player.DEX * Sword_Mastery_LVL)) + (25 + (Player.STR * Sword_Mastery_LVL))
	Sword_Mastery_XP += xp_gain
	level_up_skill("Sword_Mastery_XP", "Sword_Mastery_LVL", "Sword_Mastery_NXT_XP")
	
# Sword Slash Skill
var Sword_Slash_Unlocked = false
var Sword_Slash_LVL = 1
var Sword_Slash_XP = 0
var Sword_Slash_NXT_XP = calculate_xp_needed(Sword_Slash_LVL)

func Sword_Slash_XP_gain():
	var xp_gain = (50 * Sword_Slash_LVL) + (5 * Player.STR) + (5 * Player.DEX) + (5 * Skill.Sword_Mastery_LVL)
	Sword_Slash_XP += xp_gain
	level_up_skill("Sword_Slash_XP", "Sword_Slash_LVL", "Sword_Slash_NXT_XP")
	Gain_Sword_Mastery_XP()

func Sword_Slash():
	var en_cost = 20
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		
		Player.SHARP_DMG = (2 * Sword_Slash_LVL) \
			+ ceil(1.25 * Player.STR) \
			+ ceil(1.25 * Player.DEX) \
			+ (5 * Skill.Sword_Mastery_LVL) \
			+ Player.SWORD_DMG

		Sword_Slash_XP_gain()

# **Health Potion Skill**
var Health_Potion_Unlocked = false
var Health_Potion_LVL = 1
var Health_Potion_XP = 0
var Health_Potion_NXT_XP = calculate_xp_needed(Health_Potion_LVL)

func Gain_Health_Potion_XP():
	var xp_gain = (Player.DEX * 10) + (Health_Potion_LVL * 10)
	Health_Potion_XP += xp_gain
	level_up_skill("Health_Potion_XP", "Health_Potion_LVL", "Health_Potion_NXT_XP")

func Use_Health_Potion():
	if Inventory.minor_health_potion > 0:
		Inventory.minor_health_potion -= 1
		
		var restore_amount = 500 + (10 * Potion_Proficiency_LVL) + (Health_Potion_LVL * 10)
		Player.HP = min(Player.HP + restore_amount, Player.MAX_HP)
		PreBattleData.description_txt = "You have restored [color=#90EE90]" + str(restore_amount) + "[/color] HP"

		Gain_Health_Potion_XP()
		Gain_Potion_Proficiency_XP()

# **Mana Potion Skill**
var Mana_Potion_Unlocked = false
var Mana_Potion_LVL = 1
var Mana_Potion_XP = 0
var Mana_Potion_NXT_XP = calculate_xp_needed(Mana_Potion_LVL)

func Gain_Mana_Potion_XP():
	var xp_gain = (Player.DEX * 10) + (Mana_Potion_LVL * 10)
	Mana_Potion_XP += xp_gain
	level_up_skill("Mana_Potion_XP", "Mana_Potion_LVL", "Mana_Potion_NXT_XP")

func Use_Mana_Potion():
	if Inventory.minor_mana_potion > 0:
		Inventory.minor_mana_potion -= 1

		var restore_amount = 1000 + (10 * Potion_Proficiency_LVL) + (Mana_Potion_LVL * 10)
		Player.MP = min(Player.MP + restore_amount, Player.MAX_MP)
		PreBattleData.description_txt = "You have restored [color=#ADD8E6]" + str(restore_amount) + "[/color] MP"

		Gain_Mana_Potion_XP()
		Gain_Potion_Proficiency_XP()

# **Acid Potion Skill**
var Acid_Potion_Unlocked = false
var Acid_Potion_LVL = 1
var Acid_Potion_XP = 0
var Acid_Potion_NXT_XP = calculate_xp_needed(Acid_Potion_LVL)

func Gain_Acid_Potion_XP():
	var xp_gain = (Player.DEX * 10) + (Acid_Potion_LVL * 20)
	Acid_Potion_XP += xp_gain
	level_up_skill("Acid_Potion_XP", "Acid_Potion_LVL", "Acid_Potion_NXT_XP")

func Use_Acid_Potion():
	if Inventory.Acid_potion > 0:
		Inventory.Acid_potion -= 1

		Player.ACID_DMG = 100 + (10 * Acid_Potion_LVL) + (5 * Player.DEX)
		Gain_Acid_Potion_XP()
		Gain_Potion_Proficiency_XP()


# **Magic Seeker Skill**		
var Magic_Seeker_Unlocked = false
var Magic_Seeker_LVL = 1
var Magic_Seeker_XP = 0
var Magic_Seeker_NXT_XP = calculate_xp_needed(Magic_Seeker_LVL)

func Magic_Seeker_XP_gain():
	var xp_gain = (100 * Magic_Seeker_LVL) + (20 * Player.INT)
	Magic_Seeker_XP += xp_gain
	
func Active_Magic_Seeker():
	var mp_cost = 500
	if Player.MP >= mp_cost:
		Player.MP -= mp_cost
	
		Player.MAGIC_DMG = (10 * Magic_Blast_LVL) + (1 * Player.INT)

		Magic_Seeker_XP_gain()
		level_up_skill("Magic_Seeker_XP", "Magic_Seeker_LVL", "Magic_Seeker_NXT_XP")



func Skill_Unlock_Check():
	if Player.END >= 10:
		Skill.Physical_Endurance_Unlocked = true
	
	if Player.STR >= 10:
		Skill.Kick_Unlocked = true
		
	if Player.STR >= 100:
		Skill.Strong_Punch_Unlocked = true
		
	if Player.VIT >= 10:
		Skill.Minor_Regen_Unlocked = true
		
	if Player.INT >= 10:
		Skill.Magic_Blast_Unlocked = true
		
	if Player.INT >= 100:
		Skill.Magic_Seeker_Unlocked = true
		
	if Player.WIS >= 10:
		Skill.Lowly_Mana_Regen_Unlocked = true
