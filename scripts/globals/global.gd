extends Node

var time_elapsed: float = 0.0
var timer_running: bool = false
var grampeadores : int = 0
var contratos : int = 0

var highscore : int = 0
var t_highscore : float = 0.0
var g_highscore : int = 0
var c_highscore : int = 0
var score : int = 0
var time_bonus : int = 0

func final_score():
	score = 0
	score += grampeadores * 100
	score += contratos * 150
	var max_time := 300.0
	var max_time_bonus := 1000
	var time_used = time_elapsed
	var time_ratio = clamp(1.0 - (time_used / max_time), 0.0, 1.0)
	time_bonus = int(max_time_bonus * time_ratio)
	score += time_bonus
	return score
	
func check_highscore():
	if score > highscore:
		highscore = score
		t_highscore = time_elapsed
		g_highscore = grampeadores
		c_highscore = contratos
	
func reset_points():
	grampeadores = 0
	contratos = 0

func start_timer():
	time_elapsed = 0.0
	timer_running = true

func stop_timer():
	timer_running = false
	
func resume_timer():
	timer_running = true

func add_penalty(seconds: float):
	time_elapsed += seconds
	
func _process(delta: float) -> void:
	if timer_running:
		time_elapsed += delta
