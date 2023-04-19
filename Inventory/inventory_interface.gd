extends Control

var grabbedItem: SlotData

@onready var player_inventory: PanelContainer = $PlayerInventory
@onready var grabbed_slot: Panel = $GrabbedSlot

func _physics_process(delta: float) -> void:
	if grabbed_slot.visible:
		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5,5)

func set_player_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_interact.connect(on_inventory_interact)
	player_inventory.set_inventory_data(inventory_data)

func on_inventory_interact(inventory_data: InventoryData,index: int, button: int) -> void:
	#print("%s %s %s" % [inventory_data, index, button])
	match [grabbedItem, button]:
		[null, MOUSE_BUTTON_LEFT]:
			grabbedItem = inventory_data.grab_slot_data(index)
		[_, MOUSE_BUTTON_LEFT]:
			grabbedItem = inventory_data.drop_slot_data(grabbedItem, index)
	
	update_grabbed_item()

func update_grabbed_item() -> void:
	if grabbedItem:
		grabbed_slot.show()
		grabbed_slot.set_slot_data(grabbedItem)
	else:
		grabbed_slot.hide()
