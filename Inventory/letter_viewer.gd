extends Control

@onready var back: Button = $Back
@onready var foward: Button = $Foward
@onready var letterIMG: TextureRect = $LetterIMG
@onready var letterBody: RichTextLabel = $LetterIMG/LetterBody

var letters: LettersData = preload("res://Inventory/all_Letters.tres")
var currentIndex: int = 0

# [font=res://Fonts/SecretCodeRegular-1ylg.ttf][/font]

func _ready():
	letterBody.get_v_scroll_bar().modulate.a = 0 #Hide scrollbar
	letterBody.text = letters.letters[0].trueBody

func _on_back_pressed():
	if currentIndex > 0:
		currentIndex = currentIndex - 1
		print("Current index is: ", currentIndex)
		update_text(-1)

func _on_foward_pressed():
	currentIndex = currentIndex + 1
	print("Current index is: ", currentIndex)
	update_text(1)
	
func update_text(changeIndex: int):
	if letters.letters[currentIndex] != null:
		if letters.letters[currentIndex].collected == true:
			if letters.letters[currentIndex].sanityReq >= Global.sanity:
				letterBody.text = letters.letters[currentIndex].trueBody
			else:
				letterBody.text = letters.letters[currentIndex].bodyEncrypted
		else:
			currentIndex += changeIndex
