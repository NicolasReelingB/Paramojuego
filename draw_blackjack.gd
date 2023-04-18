extends BaseButton

const BLACKJACK = 21

@onready var stop = $"../Stop"
@onready var counter_label = $"../Counter"
@onready var name_of_card = $"../Name of card"
@onready var victory = $"../Victory"

var counter : int = 0

var random = RandomNumberGenerator.new()

var deck = [["Ace of Hearts", 11, false],
	["2 of Hearts", 2, false],
	["3 of Hearts", 3, false],
	["4 of Hearts", 4, false],
	["5 of Hearts", 5, false],
	["6 of Hearts", 6, false],
	["7 of Hearts", 7, false],
	["8 of Hearts", 8, false],
	["9 of Hearts", 9, false],
	["10 of Hearts", 10, false],
	["Jack of Hearts", 10, false],
	["Queen of Hearts", 10, false],
	["King of Hearts", 10, false],
	["Ace of Diamonds", 11, false],
	["2 of Diamonds", 2, false],
	["3 of Diamonds", 3, false],
	["4 of Diamonds", 4, false],
	["5 of Diamonds", 5, false],
	["6 of Diamonds", 6, false],
	["7 of Diamonds", 7, false],
	["8 of Diamonds", 8, false],
	["9 of Diamonds", 9, false],
	["10 of Diamonds", 10, false],
	["Jack of Diamonds", 10, false],
	["Queen of Diamonds", 10, false],
	["King of Diamonds", 10, false],
	["Ace of Clubs", 11, false],
	["2 of Clubs", 2, false],
	["3 of Clubs", 3, false],
	["4 of Clubs", 4, false],
	["5 of Clubs", 5, false],
	["6 of Clubs", 6, false],
	["7 of Clubs", 7, false],
	["8 of Clubs", 8, false],
	["9 of Clubs", 9, false],
	["10 of Clubs", 10, false],
	["Jack of Clubs", 10, false],
	["Queen of Clubs", 10, false],
	["King of Clubs", 10, false],
	["Ace of Spades", 11, false],
	["2 of Spades", 2, false],
	["3 of Spades", 3, false],
	["4 of Spades", 4, false],
	["5 of Spades", 5, false],
	["6 of Spades", 6, false],
	["7 of Spades", 7, false],
	["8 of Spades", 8, false],
	["9 of Spades", 9, false],
	["10 of Spades", 10, false],
	["Jack of Spades", 10, false],
	["Queen of Spades", 10, false],
	["King of Spades", 10, false]
]

func _ready():
	victory.text = ""
	counter_label.text = ""
	name_of_card.text = ""
	deck.shuffle()
#	var first_card = random.randi_range(0, deck.size() - 1)
#	deck[first_card][2] = true
#	counter += deck[first_card][1]
#	name_of_card.text = deck[first_card][0]
#	var second_card = random.randi_range(0, deck.size() - 1)
#	while(deck[second_card] == deck[first_card]):
#		second_card = random.randi_range(0, deck.size() - 1)
#	counter += deck[second_card][1]
#	counter_label.text = str(counter)
#	name_of_card.text += "\n" + deck[second_card][0] 
#
#	if counter == 21:
#		victory.text = "Victory"
#		stop.visible = false
	

func _pressed():
	var selected_card = random.randi_range(0, deck.size() - 1)

	while(deck[selected_card][2]):
		selected_card = random.randi_range(0, deck.size() - 1)

	if deck[selected_card][0].contains("Ace") and counter > 10:
		deck[selected_card][1] = 1

	counter += deck[selected_card][1]
	counter_label.text = str(counter)
	name_of_card.text += "\n" + deck[selected_card][0]
	deck[selected_card][2] = true
	
	if counter == 21:
		victory.text = "Victory"
		stop.visible = false
		visible = false
	
	if counter > 21:
		victory.text = "You lost, motherfucker"
		stop.visible = false
		visible = false
	
	
		
	
