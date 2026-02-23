extends Control
@onready var carimbos_container: GridContainer = $PanelContainer/MarginContainer/VBoxContainer/CarimbosContainer
@onready var carimbo_manager: Node = $"../../CarimboManager"
const CARIMBO_SLOT = preload("uid://ck1ymr0tdo6qh")


func populate_stamps(carimbos : Array):
	for child in carimbos_container.get_children():
		child.queue_free()
		
	for carimbo in carimbos:
		var new_carimbo = CARIMBO_SLOT.instantiate()
		carimbos_container.add_child(new_carimbo)
		new_carimbo.populate_slot(carimbo)
		
func unselect_slot(stamp_index):
	for child in carimbos_container.get_children():
		if child.selected_slot == stamp_index:
			child.selected = false
			child.selected_slot = -1
			child.selected_slot_label.visible = false
	populate_stamps(carimbo_manager.collected_stamps)
