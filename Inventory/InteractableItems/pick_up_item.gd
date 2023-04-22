extends RigidBody3D

signal killItem()

@export var slot_data: SlotData

@onready var sprite_3d: Sprite3D = $Sprite3D

@onready var player: CharacterBody3D = $"../Player"


func _ready() -> void:
	sprite_3d.texture = slot_data.item_data.texture
	
	
func _physics_process(delta: float) -> void:
	sprite_3d.rotate_y(delta)


func _on_area_3d_body_entered(body):
	pass
	#if body.inventory_data.pick_up_item(slot_data):
	#	queue_free()
