extends Panel

signal slot_clicked(index: int, button: int)

@onready var item: TextureRect = $SlotFrame/MarginContainer/Item

func set_slot_data(slot_data: SlotData) -> void:
	var item_data = slot_data.item_data
	item.texture = item_data.texture
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]
	


func _on_gui_input(event):
	if event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT \
			or event.button_index == MOUSE_BUTTON_RIGHT) \
			and event.is_pressed():
				# print("Testing from Slot Component") Checked and works on component level, must be signal.
				slot_clicked.emit(get_index(), event.button_index)
