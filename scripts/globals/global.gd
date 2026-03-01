extends Node

var time_elapsed: float = 0.0
var timer_running: bool = false
var grampeadores : int = 0
var contratos : int = 0

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
