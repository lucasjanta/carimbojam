extends Control



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/level_manager.tscn")

func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/tutorial_level.tscn")

func _on_options_button_pressed() -> void:
	$PanelContainer/MarginContainer/VBoxContainer/MenuContainer.visible = false
	$PanelContainer/MarginContainer/VBoxContainer/OptionsContainer.visible = true


func _on_credits_button_pressed() -> void:
	$PanelContainer/MarginContainer/VBoxContainer/CreditsContainer.visible = true
	$PanelContainer/MarginContainer/VBoxContainer/MenuContainer.visible = false

func _on_quit_button_pressed() -> void:
	get_tree().quit()
