extends Node2D
@onready var phantom_camera: PhantomCamera2D = $Camera2D/PhantomCameraHost/PhantomCamera2D
@onready var time_label: Label = $CanvasLayer/Control/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer3/TimeLabel
@onready var grampeadores_label: Label = $CanvasLayer/Control/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/GrampeadoresLabel
@onready var contratos_label: Label = $CanvasLayer/Control/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/ContratosLabel
@onready var score_screen: Control = $CanvasLayer/Score

var on_l1 := false
var on_l2 := false
var on_l3 := false
var on_l4 := false

func _ready() -> void:
	Global.start_timer()
	Global.reset_points()

func _on_lv_1_area_body_entered(body: Node2D) -> void:
	if body is Player:
		on_l1 = true
		print("on level 1")
		check_camera()

func _on_lv_1_area_body_exited(body: Node2D) -> void:
	if body is Player:
		on_l1 = false
		check_camera()

func _on_lv_2_area_body_entered(body: Node2D) -> void:
	if body is Player:
		on_l2 = true
		check_camera()

func _on_lv_2_area_body_exited(body: Node2D) -> void:
	if body is Player:
		on_l2 = false
		check_camera()

func _on_lv_3_area_body_entered(body: Node2D) -> void:
	if body is Player:
		on_l3 = true
		check_camera()

func _on_lv_3_area_body_exited(body: Node2D) -> void:
	if body is Player:
		on_l3 = false
		check_camera()

func _on_lv_4_area_body_entered(body: Node2D) -> void:
	if body is Player:
		on_l4 = true
		check_camera()

func _on_lv_4_area_body_exited(body: Node2D) -> void:
	if body is Player:
		on_l4 = false
		check_camera()

func check_camera():
	if !on_l1 and on_l2:
		set_room_limits(0, 1616, -464, -144)
	if !on_l2 and on_l1:
		set_room_limits(0, 1616, -144, 176)
	if !on_l2 and on_l3:
		set_room_limits(0, 1616, -800, -464)
	if !on_l3 and on_l2:
		set_room_limits(0, 1616, -464, -144)
	if !on_l3 and on_l4:
		set_room_limits(0, 1616, -1120, -800)
	if !on_l4 and on_l3:
		set_room_limits(0, 1616, -800, -464)

func set_room_limits(left, right, top, bottom):
	phantom_camera.limit_left = left
	phantom_camera.limit_right = right
	phantom_camera.limit_top = top
	phantom_camera.limit_bottom = bottom

func _process(delta: float) -> void:
	time_label.text = format_time(Global.time_elapsed)
	grampeadores_label.text = "%s/18" % Global.grampeadores
	contratos_label.text = "%s/18" % Global.contratos
	
func format_time(time: float) -> String:
	var total_seconds = int(time)
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60
	
	return "%02d:%02d" % [minutes, seconds]

func end_level():
	Global.stop_timer()
	Global.final_score()
	Global.check_highscore()
	get_tree().paused = true
	score_screen.visible = true
	score_screen.pop_info()


func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
