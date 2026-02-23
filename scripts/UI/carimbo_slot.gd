extends PanelContainer
@onready var name_label: Label = $MarginContainer/VBoxContainer/NameLabel
@onready var texture_rect: TextureRect = $TextureRect
@onready var selected_slot_label: Label = $MarginContainer/VBoxContainer/selectedSlotLabel

var carimbo_name : String = ""
var description : String = ""
var cooldown : float = 0.0
var selected := false
var selected_slot : int = -1

func populate_slot(carimbo : CarimboData):
	name_label.text = carimbo.name
	texture_rect.texture = carimbo.icon
	carimbo_name = carimbo.name
	description = carimbo.description
	cooldown = carimbo.cooldown
	selected_slot_label.visible = selected
	selected_slot_label.text = str(selected_slot + 1)


func _on_button_mouse_entered() -> void:
	get_parent().update_description(carimbo_name, description, cooldown)


func _on_button_pressed() -> void:
	var carimbo_inventory = get_tree().get_first_node_in_group("player").inventory
	var carimbos_ui = get_tree().get_first_node_in_group("player").carimbos_selecionados
	var carimbo_manager = get_tree().get_first_node_in_group("player").carimbo_manager
	var current_slot = carimbo_manager.current_slot
	#if !selected:
	selected = true
	selected_slot = current_slot
	carimbo_manager.equipped_stamps[current_slot] = get_stamp_by_name(carimbo_name)
	carimbos_ui.populate_slots(carimbo_manager.equipped_stamps)
	selected_slot_label.visible = selected
	selected_slot_label.text = str(selected_slot + 1)
	#else:
		#if current_slot != selected_slot:
			#carimbo_inventory.unselect_slot(current_slot)
			#carimbo_manager.equipped_stamps[current_slot] = get_stamp_by_name(carimbo_name)
		
	
func get_stamp_by_name(stamp_name: String) -> CarimboData:
	for stamp in get_tree().get_first_node_in_group("player").carimbo_manager.collected_stamps:
		if stamp.name == stamp_name:
			return stamp
	return null
