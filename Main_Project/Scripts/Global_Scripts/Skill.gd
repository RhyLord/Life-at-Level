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
	var xp_gain = ceil(0.5 * (Player.MAX_HP + Player.MAX_MP + Player.MAX_EN))
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
	var xp_gain = ceil(0.5 * Player.MAX_EN)
	Rest_XP += xp_gain
	level_up_skill("Rest_XP", "Rest_LVL", "Rest_NXT_XP")
	
func Combat_Rest():
	var restore_amount = (5 * Rest_LVL) + Player.END
	Player.EN = min(Player.EN + restore_amount, Player.MAX_EN)
	PreBattleData.desciption_txt = "You have restored [" + str(restore_amount) + "] EN"
	Combat_Rest_XP()

# Push-Up Skill
var PushUp_Unlocked = true
var PushUp_LVL = 1
var PushUp_XP = 0
var PushUp_NXT_XP = calculate_xp_needed(PushUp_LVL)

func PushUp_stat_gain():
	Player.STR += 1 

func Active_PushUp_XP():
	var xp_gain = 25 + Player.MAX_EN
	PushUp_XP += xp_gain
	level_up_skill("PushUp_XP", "PushUp_LVL", "PushUp_NXT_XP", PushUp_stat_gain)

func Active_PushUp():
	var en_cost = ceil(0.25 * Player.MAX_EN)
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_PushUp_XP()

#Run Skill		
var Run_Unlocked = true
var Run_LVL = 1
var Run_XP = 0
var Run_NXT_XP = calculate_xp_needed(Run_LVL)

func Run_stat_gain():
	Player.MAX_EN += 10

func Active_Run_XP():
	var xp_gain = 50 + ceil(0.25 * Player.MAX_EN)
	Run_XP += xp_gain
	level_up_skill("Run_XP", "Run_LVL", "Run_NXT_XP", Run_stat_gain)
	
func Active_Run():
	var en_cost = ceil(0.25 * Player.MAX_EN)
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_Run_XP()
		
# **Study Skill**		
var Study_Unlocked = true
var Study_LVL = 1
var Study_XP = 0
var Study_NXT_XP = calculate_xp_needed(Study_LVL)

func Study_stat_gain():
	Player.INT += 1
	
func Active_Study_XP():
	var xp_gain = 10 * Player.INT  # XP formula: (10 * INT)
	Study_XP += xp_gain
	level_up_skill("Study_XP", "Study_LVL", "Study_NXT_XP", Study_stat_gain)
	
func Active_Study():
	var en_cost = ceil(0.05 * Player.MAX_EN)   # Consumes 5% of EN
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_Study_XP()


# **Punch Skill**		
var Punch_Unlocked = true
var Punch_LVL = 1
var Punch_XP = 0
var Punch_NXT_XP = calculate_xp_needed(Punch_LVL)

func Punch_XP_gain():
	var xp_gain = 50 + (10 * Player.STR)  # XP formula
	Punch_XP += xp_gain
	

func Punch():
	var en_cost = 5  # Active: Consumes 5 EN
	if Player.EN >= en_cost:
		Player.EN -= en_cost  # Reduce EN
	
		Player.ACCURACY = 100 + (1 * Player.DEX)
		Player.PHYSICAL_DMG = (1 * Punch_LVL) + (1 * Player.STR)

		Punch_XP_gain()
		level_up_skill("Punch_XP", "Punch_LVL", "Punch_NXT_XP")

# **Squat Skill**
var Squat_Unlocked = true
var Squat_LVL = 1
var Squat_XP = 0
var Squat_NXT_XP = calculate_xp_needed(Squat_LVL)

func Squat_stat_gain():
	Player.MAX_HP += 10

func Active_Squat_XP():
	var xp_gain = 50 + Player.MAX_EN  # XP formula: (50 + MAX_EN)
	Squat_XP += xp_gain
	level_up_skill("Squat_XP", "Squat_LVL", "Squat_NXT_XP", Squat_stat_gain)

func Active_Squat():
	var en_cost = ceil(0.25 * Player.MAX_EN)  # Consumes 25% of MAX_EN
	if Player.EN >= en_cost:
		Player.EN -= en_cost
		Global.cycle_time()
		Active_Squat_XP()
