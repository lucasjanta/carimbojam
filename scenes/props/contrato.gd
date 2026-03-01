extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_area_entered(area: Area2D) -> void:
	if area.name == "carimbo":
		Global.contratos += 1
		animation_player.play("aprovado")
		
