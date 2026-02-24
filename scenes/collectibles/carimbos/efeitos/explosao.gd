extends Node2D

#func _ready() -> void:
	#get_parent().


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.take_damage(10)
		var direction = body.global_position - global_position
		direction = direction.normalized()
		body.apply_knockback(direction, 300)
