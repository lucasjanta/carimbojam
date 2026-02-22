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
	selected_slot_label.text = str(selected_slot)


func _on_button_mouse_entered() -> void:
	get_parent().update_description(carimbo_name, description, cooldown)
