extends CharacterBody2D
#class_name Enemy

@export var speed := 150.0
@export var left_limit : Marker2D
@export var right_limit : Marker2D
@export var max_hp := 30.0
var hp := 0.0
var can_attack := false

func _ready() -> void:
	hp = max_hp

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += 800 * delta

	move_and_slide()

#func take_damage(dmg):
	#hp -= dmg
	#show_hit(dmg)
	#if hp <= 0:
		#die()
#
#func show_hit(damage):
	#var new_lb = HIT_LABEL.instantiate()
	#new_lb.text = "-" + str(damage)
	#get_parent().add_child(new_lb)
	#new_lb.global_position = global_position

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is Player:
		can_attack = true


func _on_attack_area_body_exited(body: Node2D) -> void:
	if body is Player:
		can_attack = false
