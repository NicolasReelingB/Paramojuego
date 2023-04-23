extends BaseButton

const BLACKJACK = 21

@onready var stop = $"../Stop"
@onready var counter_label = $"../Counter"
@onready var name_of_card = $"../Name of card"
@onready var victory = $"../Victory"
@onready var grid_container = $"../GridContainer"
@onready var latest_card = $"../LatestCard"
@onready var card_one = $"../GridContainer/CardOne"


var counter : int = 0

var random = RandomNumberGenerator.new()

var deck = [["Ace of Hearts", 11, false, "res://Blackjack/Cards/hearts_01.png"],
	["2 of Hearts", 2, false, "res://Blackjack/Cards/hearts_02.png"],
	["3 of Hearts", 3, false, "res://Blackjack/Cards/hearts_03.png"],
	["4 of Hearts", 4, false, "res://Blackjack/Cards/hearts_04.png"],
	["5 of Hearts", 5, false, "res://Blackjack/Cards/hearts_05.png"],
	["6 of Hearts", 6, false, "res://Blackjack/Cards/hearts_06.png"],
	["7 of Hearts", 7, false, "res://Blackjack/Cards/hearts_07.png"],
	["8 of Hearts", 8, false, "res://Blackjack/Cards/hearts_08.png"],
	["9 of Hearts", 9, false, "res://Blackjack/Cards/hearts_09.png"],
	["10 of Hearts", 10, false, "res://Blackjack/Cards/hearts_10.png"],
	["Jack of Hearts", 10, false, "res://Blackjack/Cards/hearts_11.png"],
	["Queen of Hearts", 10, false, "res://Blackjack/Cards/hearts_12.png"],
	["King of Hearts", 10, false, "res://Blackjack/Cards/hearts_13.png"],
	["Ace of Diamonds", 11, false, "res://Blackjack/Cards/diamonds_01.png"],
	["2 of Diamonds", 2, false, "res://Blackjack/Cards/diamonds_02.png"],
	["3 of Diamonds", 3, false, "res://Blackjack/Cards/diamonds_03.png"],
	["4 of Diamonds", 4, false, "res://Blackjack/Cards/diamonds_04.png"],
	["5 of Diamonds", 5, false, "res://Blackjack/Cards/diamonds_05.png"],
	["6 of Diamonds", 6, false, "res://Blackjack/Cards/diamonds_06.png"],
	["7 of Diamonds", 7, false, "res://Blackjack/Cards/diamonds_07.png"],
	["8 of Diamonds", 8, false, "res://Blackjack/Cards/diamonds_08.png"],
	["9 of Diamonds", 9, false, "res://Blackjack/Cards/diamonds_09.png"],
	["10 of Diamonds", 10, false, "res://Blackjack/Cards/diamonds_10.png"],
	["Jack of Diamonds", 10, false, "res://Blackjack/Cards/diamonds_11.png"],
	["Queen of Diamonds", 10, false, "res://Blackjack/Cards/diamonds_12.png"],
	["King of Diamonds", 10, false, "res://Blackjack/Cards/diamonds_13.png"],
	["Ace of Clubs", 11, false, "res://Blackjack/Cards/clubs_01.png"],
	["2 of Clubs", 2, false, "res://Blackjack/Cards/clubs_02.png"],
	["3 of Clubs", 3, false, "res://Blackjack/Cards/clubs_03.png"],
	["4 of Clubs", 4, false, "res://Blackjack/Cards/clubs_04.png"],
	["5 of Clubs", 5, false, "res://Blackjack/Cards/clubs_05.png"],
	["6 of Clubs", 6, false, "res://Blackjack/Cards/clubs_06.png"],
	["7 of Clubs", 7, false, "res://Blackjack/Cards/clubs_07.png"],
	["8 of Clubs", 8, false, "res://Blackjack/Cards/clubs_08.png"],
	["9 of Clubs", 9, false, "res://Blackjack/Cards/clubs_09.png"],
	["10 of Clubs", 10, false, "res://Blackjack/Cards/clubs_10.png"],
	["Jack of Clubs", 10, false, "res://Blackjack/Cards/clubs_11.png"],
	["Queen of Clubs", 10, false, "res://Blackjack/Cards/clubs_12.png"],
	["King of Clubs", 10, false, "res://Blackjack/Cards/clubs_13.png"],
	["Ace of Spades", 11, false, "res://Blackjack/Cards/spades_01.png"],
	["2 of Spades", 2, false, "res://Blackjack/Cards/spades_02.png"],
	["3 of Spades", 3, false, "res://Blackjack/Cards/spades_03.png"],
	["4 of Spades", 4, false, "res://Blackjack/Cards/spades_04.png"],
	["5 of Spades", 5, false, "res://Blackjack/Cards/spades_05.png"],
	["6 of Spades", 6, false, "res://Blackjack/Cards/spades_06.png"],
	["7 of Spades", 7, false, "res://Blackjack/Cards/spades_07.png"],
	["8 of Spades", 8, false, "res://Blackjack/Cards/spades_08.png"],
	["9 of Spades", 9, false, "res://Blackjack/Cards/spades_09.png"],
	["10 of Spades", 10, false, "res://Blackjack/Cards/spades_10.png"],
	["Jack of Spades", 10, false, "res://Blackjack/Cards/spades_11.png"],
	["Queen of Spades", 10, false, "res://Blackjack/Cards/spades_12.png"],
	["King of Spades", 10, false, "res://Blackjack/Cards/spades_13.png"]
]

func _ready():
	victory.text = ""
	counter_label.text = ""
	#name_of_card.text = ""
	deck.shuffle()
	var first_card = random.randi_range(0, deck.size() - 1)
	deck[first_card][2] = true
	counter += deck[first_card][1]
	card_one.set_texture(load(deck[first_card][3]))
	#name_of_card.text = deck[first_card][0]
	var second_card = random.randi_range(0, deck.size() - 1)
	while(deck[second_card] == deck[first_card]):
		second_card = random.randi_range(0, deck.size() - 1)
	counter += deck[second_card][1]
	moveCards(load(deck[second_card][3]))
	counter_label.text = "Score: " + str(counter)
	#name_of_card.text += "\n" + deck[second_card][0] 

	if counter == 21:
		victory.text = "You won!"
		stop.visible = false
	

func _pressed():
	var selected_card = random.randi_range(0, deck.size() - 1)

	while(deck[selected_card][2]):
		selected_card = random.randi_range(0, deck.size() - 1)

	if deck[selected_card][0].contains("Ace") and counter > 10:
		deck[selected_card][1] = 1

	counter += deck[selected_card][1]
	moveCards(load(deck[selected_card][3]))
	#var textura = load(deck[selected_card][3])
	#texture_rect.set_texture(textura)
	#var newText = texture_rect.duplicate()

	#grid_container.add_child(newText)
	counter_label.text = "Score: " + str(counter)
	#name_of_card.text += "\n" + deck[selected_card][0]
	deck[selected_card][2] = true
	
	if counter == 21:
		victory.text = "Victory"
		stop.visible = false
		self.disabled = true
		self.icon = load("res://Blackjack/Cards/joker_0.png")
		
	if counter > 21:
		victory.text = "Try again chump"
		stop.visible = false
		self.disabled = true
		self.icon = load("res://Blackjack/Cards/joker_1.png")
	
func moveCards(newCard: Texture2D):
	if latest_card.texture != null:
		var newText = card_one.duplicate()
		newText.set_texture(latest_card.texture)
		grid_container.add_child(newText)
		latest_card.set_texture(newCard)
	else:
		latest_card.set_texture(newCard)
		
	
