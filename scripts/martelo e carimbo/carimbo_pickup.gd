extends Area2D

@export var stamp_data : CarimboData

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Player:
		body.carimbo_manager.collect_stamp(stamp_data)
		queue_free()
