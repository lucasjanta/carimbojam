extends CharacterBody2D

@export var speed := 250.0
@export var jump_force := -400.0
@export var gravity_force := 900.0



func _physics_process(delta: float) -> void:
	# Adiciona gravidade
	if not is_on_floor():
		velocity.y += gravity_force * delta

	move_and_slide()
