extends HBoxContainer
var carimbo_slots : Array[PanelContainer]

func _ready() -> void:
	for child in get_children():
		carimbo_slots.append(child)

func populate_slots(equipped_slots : Array[CarimboData]):
	for i in 3:
		if equipped_slots[i] != null:
			carimbo_slots[i].texture_rect.texture = equipped_slots[i].icon
			carimbo_slots[i].nome_carimbo.text = equipped_slots[i].name
			carimbo_slots[i].description = equipped_slots[i].description
			carimbo_slots[i].cooldown = equipped_slots[i].cooldown
	
func change_selected_slot(index):
	for carimbo in carimbo_slots:
		carimbo.self_modulate.a = 0.5
	carimbo_slots[index].self_modulate.a = 1.0
