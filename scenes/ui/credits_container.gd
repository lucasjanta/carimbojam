extends VBoxContainer
@onready var menu_container: VBoxContainer = $"../MenuContainer"
@onready var credits_container: VBoxContainer = $"."

func _on_voltar_button_pressed() -> void:
	menu_container.visible = true
	credits_container.visible = false
