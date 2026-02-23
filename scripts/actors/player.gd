extends CharacterBody2D
class_name Player

@export var speed := 250.0
@export var jump_force := -300.0
@export var gravity_force := 900.0
@onready var carimbo_manager: Node = $CarimboManager
@onready var inventory: Control = $CanvasLayer/Inventory
@onready var carimbos_selecionados: HBoxContainer = $CanvasLayer/UI/PanelContainer/MarginContainer/CarimbosUI
@onready var stamp_effect_position: Marker2D = $StampEffectPosition


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
	if event.is_action_pressed("slot_1"):
		carimbo_manager.current_slot = 0
	if event.is_action_pressed("slot_2"):
		carimbo_manager.current_slot = 1
	if event.is_action_pressed("slot_3"):
		carimbo_manager.current_slot = 2
	
	if event.is_action_pressed("use_stamp"):
		carimbo_manager.use_current_stamp()
