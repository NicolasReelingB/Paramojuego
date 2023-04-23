extends Control

var grabbedItem: SlotData

@onready var player_inventory: PanelContainer = $PlayerInventory
@onready var grabbed_slot: Panel = $GrabbedSlot
@onready var toggle_letter_interface = $toggleLetterInterface
@onready var letter_viewer = $Letter_Viewer

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
		[_, MOUSE_BUTTON_RIGHT]:
			if grabbedItem != null and index != null:
				grabbedItem = inventory_data.combine_items(grabbedItem, index)
	
	update_grabbed_item()

func update_grabbed_item() -> void:
	if grabbedItem:
		grabbed_slot.show()
		grabbed_slot.set_slot_data(grabbedItem)
	else:
		grabbed_slot.hide()


func _on_gui_input(event):
	if event is InputEventMouseButton \
			and event.is_pressed() \
			and grabbedItem:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				grabbedItem = null
				update_grabbed_item()


func _on_toggle_letter_interface_pressed():
	letter_viewer.visible = not letter_viewer.visible
	if letter_viewer.visible:
		toggle_letter_interface.visible = false
