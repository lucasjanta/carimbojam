extends CharacterBody2D
class_name Player

@onready var carimbo_manager: Node = $CarimboManager
@onready var inventory: Control = $CanvasLayer/Inventory
@onready var carimbos_selecionados: HBoxContainer = $CanvasLayer/UI/PanelContainer/MarginContainer/CarimbosUI
@onready var stamp_effect_position: Marker2D = $StampEffectPosition
@onready var stats_container: PanelContainer = $CanvasLayer/UI/StatsContainer
@onready var state_machine: Node = $StateMachine


@export var speed := 250.0
@export var jump_force := -300.0
@export var gravity_force := 900.0
@export var max_hp := 100.0

var hp := 0.0
var selected_stamp := 0


func _ready() -> void:
	hp = max_hp
	stats_container.update_ui(max_hp, hp)
	
func update_inventory():
	inventory.populate_stamps(carimbo_manager.collected_stamps)

func take_damage(damage):
	hp -= damage
	stats_container.update_ui(max_hp, hp)
	if hp <= 0.0:
		print("player is dead")

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity.y += gravity_force * delta

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		inventory.visible = !inventory.visible
	if event.is_action_pressed("slot_1"):
		selected_stamp = 0
		carimbo_manager.current_slot = selected_stamp
		carimbos_selecionados.change_selected_slot(selected_stamp)
	if event.is_action_pressed("slot_2"):
		selected_stamp = 1
		carimbo_manager.current_slot = selected_stamp
		carimbos_selecionados.change_selected_slot(selected_stamp)
	if event.is_action_pressed("slot_3"):
		selected_stamp = 2
		carimbo_manager.current_slot = selected_stamp
		carimbos_selecionados.change_selected_slot(selected_stamp)
	
	if event.is_action_pressed("next_item"):
		if selected_stamp < 2:
			selected_stamp += 1
		else:
			selected_stamp = 0
		carimbo_manager.current_slot = selected_stamp
		carimbos_selecionados.change_selected_slot(selected_stamp)
		
	if event.is_action_pressed("previous_item"):
		if selected_stamp > 0:
			selected_stamp -= 1
		else:
			selected_stamp = 2
		carimbo_manager.current_slot = selected_stamp
		carimbos_selecionados.change_selected_slot(selected_stamp)
	#
	#if event.is_action_pressed("use_stamp"):
		#carimbo_manager.use_current_stamp()
