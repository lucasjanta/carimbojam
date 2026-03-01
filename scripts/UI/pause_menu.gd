extends Control
@onready var music_slider: HSlider = $PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/MusicSlider
@onready var sfx_slider: HSlider = $PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/SFXSlider
@onready var check_box: CheckBox = $PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer3/CheckBox
@onready var player: Player = $"../.."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("music")))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("sfx")))
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		check_box.button_pressed = true
	else:
		check_box.button_pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_music_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("music"), db)


func _on_sfx_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("sfx"), db)


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)



func _on_resume_button_pressed() -> void:
	visible = false
	get_tree().paused = false
	
	


func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	player.get_parent().get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
