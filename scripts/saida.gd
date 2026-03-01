extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("fim do nivel")
		get_parent().end_level()
