extends BaseButton

# Player UI stuff
@onready var num_input = $"../NumInput"
@onready var score_player_label = $"../ScorePlayer"
@onready var cn_player = $"../CNPlayer"

# NPC 1 UI stuff
@onready var score_npc_1_label = $"../ScoreNPC1"
@onready var cnnpc_1 = $"../CNNPC1"

# NPC 2 UI stuff
@onready var score_npc_2_label = $"../ScoreNPC2"
@onready var cnnpc_2 = $"../CNNPC2"

# NPC 3 UI stuff
@onready var score_npc_3_label = $"../ScoreNPC3"
@onready var cnnpc_3 = $"../CNNPC3"

@onready var average_label = $"../Average"

var score_player : int = 0
var score_npc1 : int = 0
var score_npc2 : int = 0
var score_npc3 : int = 0

var random = RandomNumberGenerator.new()

func _ready():
	score_player_label.text = "0"
	score_npc_1_label.text = "0"
	score_npc_2_label.text = "0"
	score_npc_3_label.text = "0"

func _pressed():
	var num_choosed = int(num_input.text)
	cn_player.text = num_input.text
	
	var npc1_nc = random.randi_range(1, 100)
	var npc2_nc = random.randi_range(1, 100)
	var npc3_nc = random.randi_range(1, 100)
	
	cnnpc_1.text = str(npc1_nc)
	cnnpc_2.text = str(npc2_nc)
	cnnpc_3.text = str(npc3_nc)
	
	var average = round(((num_choosed + npc1_nc + npc2_nc + npc3_nc) / 4) * 0.8)
	
	average_label.text = str(average)
	
	var distance_player = abs(average - num_choosed)
	var distance_npc1 = abs(average - npc1_nc)
	var distance_npc2 = abs(average - npc2_nc)
	var distance_npc3 = abs(average - npc3_nc)
	
	if distance_player < distance_npc1 and distance_player < distance_npc2 and distance_player < distance_npc3:
		score_npc1 -= 1
		score_npc2 -= 1
		score_npc3 -= 1
	elif distance_npc1 < distance_npc2 and distance_npc1 < distance_npc3:
		score_player -= 1
		score_npc2 -= 1
		score_npc3 -= 1
	elif distance_npc2 < distance_npc3:
		score_player -= 1
		score_npc1 -= 1
		score_npc3 -= 1
	else:
		score_player -= 1
		score_npc1 -= 1
		score_npc2 -= 1
		
	score_player_label.text = str(score_player)
	score_npc_1_label.text = str(score_npc1)
	score_npc_2_label.text = str(score_npc2)
	score_npc_3_label.text = str(score_npc3)
