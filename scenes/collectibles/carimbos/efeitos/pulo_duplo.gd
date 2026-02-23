extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("stamp_anim")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "ground":
		get_parent().velocity.y = -500
