extends Resource
class_name LetterData

@export var title: String = ""
@export var sanityReq: int = 100
@export_multiline var bodyEncrypted: String = ""
@export_multiline var trueBody: String = ""
@export var img: Sprite2D  
@export var font: Font = load("res://Fonts/American Typewriter Regular.ttf")
@export var collected: bool = false
