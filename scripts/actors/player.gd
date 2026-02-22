extends CharacterBody2D
class_name Player

@export var speed := 250.0
@export var jump_force := -300.0
@export var gravity_force := 900.0
@onready var carimbo_manager: Node = $CarimboManager
@onready var inventory: Control = $CanvasLayer/Inventory

func update_inventory():
	inventory.populate_stamps(carimbo_manager.collected_stamps)

func _physics_process(delta: float) -> void:
	# Adiciona gravidade
	if not is_on_floor():
		velocity.y += gravity_force * delta

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		inventory.visible = !inventory.visible
