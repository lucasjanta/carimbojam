extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_area_entered(area: Area2D) -> void:
	if area.name == "carimbo":
		print("+ 1 contrato")
		animation_player.play("aprovado")
		
