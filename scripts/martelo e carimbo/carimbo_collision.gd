extends Area2D
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		animation_player.play("carimbada")

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "ground":
		get_parent().velocity.y = -500

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "carimbada":
		animation_player.play("RESET")
