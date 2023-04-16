extends Area2D

@onready var area_right = $"../../Box/AreaRight"
@onready var area_left = $"../../Box/AreaLeft"
@onready var click_zone = $"../../Box/ClickZone"
@onready var air = $"../../../Air"

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
#	if (Input.is_action_just_pressed("breathe") and not overlaps_area(click_zone)):
#
	
		
	
		
