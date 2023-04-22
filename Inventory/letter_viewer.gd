extends Control

@onready var back: Button = $Back
@onready var foward: Button = $Foward
@onready var letterIMG: TextureRect = $LetterIMG
@onready var letterBody: RichTextLabel = $LetterIMG/LetterBody

var letters: LettersData = preload("res://Inventory/all_Letters.tres")
var currentIndex: int = 0

func _ready():
	#letters[0] = testLetter
	letterBody.get_v_scroll_bar().modulate.a = 0 #Hide scrollbar
	letterBody.text = letters.letters[0].body

func _on_back_pressed():
	print(letterBody.get_selected_text())
	currentIndex -= 1
	print("Test Back Button")

func _on_foward_pressed():
	currentIndex += 1
	print("Test Foward Button")
