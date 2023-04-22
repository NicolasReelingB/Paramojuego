extends Resource
class_name InventoryData

signal inventory_updated(inventory_data: InventoryData)
signal inventory_interact(inventory_data: InventoryData, index: int, button: int)

const Necronomicon: SlotData = preload("res://Inventory/Items/Necronomicon.tres")

@export var slot_datas: Array[SlotData]

func grab_slot_data(index: int) -> SlotData:
	var slot_data = slot_datas[index]
	if slot_data:
		slot_datas[index] = null
		inventory_updated.emit(self)
		return slot_data
	else:
		return null 
		
func drop_slot_data(grabbedItem: SlotData, index: int) -> SlotData:
	var slot_data = slot_datas[index]
	slot_datas[index] = grabbedItem
	inventory_updated.emit(self)
	return slot_data

func add_item(slot_data: SlotData) -> bool:
	for index in slot_datas.size():
		if slot_datas[index] == null:
			slot_datas[index] = slot_data
			inventory_updated.emit(self)
			return true
	
	return false	

func combine_items(grabbedItem: SlotData, index: int) -> SlotData:
	if slot_datas[index]:
		var secondItem = slot_datas[index].item_data
		if grabbedItem.item_data.name == "Codex" and secondItem.name == "Skull":
			slot_datas[index] = Necronomicon
			inventory_updated.emit(self)
			grabbedItem = null
			return grabbedItem
		return grabbedItem
	return grabbedItem
			
func on_slot_clicked(index: int, button: int) -> void:
	#print("inventory")
	inventory_interact.emit(self, index, button)
