extends Area2D

@onready var area_right = $"../../Box/AreaRight"
@onready var area_left = $"../../Box/AreaLeft"
@onready var click_zone = $"../../Box/ClickZone"
@onready var air = $"../../../Air"
@onready var fear = $"../../../Fear"

func _physics_process(delta):
	if (overlaps_area(area_right) or overlaps_area(area_left)):
		if not Global.touch_borders:
			Global.change_direction()
			Global.touch_borders = true
	else: 
		Global.touch_borders = false
		
	if(overlaps_area(click_zone) and Input.is_action_just_pressed("breathe")):
		air.value += 5
		print("Take a deep breathe")
		if(fear.value != 0):
			fear.value -= 2
	if (Input.is_action_just_pressed("breathe") and not overlaps_area(click_zone)):
		fear.value += 4
		print("Calm down")
		
	if(fear.value >= 70 and not Global.fear_high):
		Global.value *= 2
		Global.fear_high = true
		
	elif fear.value < 70 and Global.fear_high:
		Global.value /= 2
		Global.fear_high = false
	
#
	
		
	
		
