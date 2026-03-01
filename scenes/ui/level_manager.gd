extends Control
@onready var time_label: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer3/timeLabel
@onready var grampeadores_total: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/grampeadoresTotal
@onready var contratos_total: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/contratosTotal
@onready var points_label: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer/MarginContainer/PointsLabel

func _ready() -> void:
	time_label.text = format_time(Global.t_highscore)
	grampeadores_total.text = str(Global.g_highscore)
	contratos_total.text = str(Global.c_highscore)
	points_label.text = str(Global.highscore)

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")


func _on_start_l_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func format_time(time: float) -> String:
	var total_seconds = int(time)
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60
	
	return "%02d:%02d" % [minutes, seconds]
