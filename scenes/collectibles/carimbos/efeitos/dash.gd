extends Node2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		var dir = 0
		if body.animated_sprite_2d.flip_h == false:
			dir = 1
		else:
			dir = -1
		body.dash_dir = dir
		body.dashing = true
