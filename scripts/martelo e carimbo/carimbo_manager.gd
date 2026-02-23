extends Node
@onready var inventory: Control = $"../CanvasLayer/Inventory"
@onready var stamp_effect_position: Marker2D = $"../StampEffectPosition"

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
