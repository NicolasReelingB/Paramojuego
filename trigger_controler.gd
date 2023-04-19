extends Area3D

@onready var player = $"../Player"
@onready var chile_morron = $"../UI/ChileMorron"

@onready var timer = $"../Timer"

func _ready():
	timer.timeout.connect(hide_sreamer)

func _physics_process(delta):
	if(overlaps_body(player)):
		chile_morron.visible = true
		timer.start()

func hide_sreamer():
	chile_morron.visible = false
