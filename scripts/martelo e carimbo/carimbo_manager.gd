extends Node
@onready var inventory: Control = $"../CanvasLayer/Inventory"
@onready var stamp_effect_position: Marker2D = $"../StampEffectPosition"
@onready var equipped_slot_1: PanelContainer = $"../CanvasLayer/UI/PanelContainer/MarginContainer/CarimbosUI/equipped_slot"
@onready var equipped_slot_2: PanelContainer = $"../CanvasLayer/UI/PanelContainer/MarginContainer/CarimbosUI/equipped_slot2"
@onready var equipped_slot_3: PanelContainer = $"../CanvasLayer/UI/PanelContainer/MarginContainer/CarimbosUI/equipped_slot3"


var collected_stamps : Array[CarimboData] = []
var equipped_stamps : Array[CarimboData] = [null, null, null]
var current_slot : int = 0
var cooldowns : Array[float] = [0,0,0]

func collect_stamp(stamp : CarimboData):
	collected_stamps.append(stamp)
	inventory.populate_stamps(collected_stamps)

func use_current_stamp():
	var stamp = equipped_stamps[current_slot]

	if cooldowns[current_slot] > 0:
		return
	if stamp != null:
		activate_stamp(stamp)
		cooldowns[current_slot] = stamp.cooldown
	
func activate_stamp(stamp: CarimboData):
	var effect_instance = stamp.effect_scene.instantiate()
	get_parent().add_child(effect_instance)
	# Adicionar local correto para lançar habilidade
	effect_instance.global_position = stamp_effect_position.global_position

func _physics_process(delta: float) -> void:
	if cooldowns[0] > 0:
		cooldowns[0] -= delta
	if cooldowns[1] > 0:
		cooldowns[1] -= delta
	if cooldowns[2] > 0:
		cooldowns[2] -= delta
	
	equipped_slot_1.update_progress_bar(cooldowns[0])
	equipped_slot_2.update_progress_bar(cooldowns[1])
	equipped_slot_3.update_progress_bar(cooldowns[2])
	
