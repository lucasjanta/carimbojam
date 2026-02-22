extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "ground":
		get_parent().velocity.y = -500
		queue_free()
