extends CharacterBody2D
class_name Enemy

const HIT_LABEL = preload("uid://baookr7ohiu84")


@export var follow_speed := 80.0
@export var attack_speed := 250.0
@export var dash_distance := 200.0
@export var max_hp := 20.0
@export var base_dmg := 20.0

var hp := 0.0
var knockback_velocity := Vector2.ZERO
var player_ref : CharacterBody2D = null
var can_attack := false
var cooldown := 0.0
var attack_cd := 2.5

func _ready() -> void:
	hp = max_hp

func _physics_process(delta: float) -> void:
	if cooldown > 0.0:
		cooldown -= delta
	if knockback_velocity > Vector2.ZERO:
		velocity = knockback_velocity
		knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, 1000 * delta)
	move_and_slide()
	

func take_damage(dmg):
	hp -= dmg
	show_hit(dmg)
	if hp <= 0:
		die()

func show_hit(damage):
	var new_lb = HIT_LABEL.instantiate()
	new_lb.text = "-" + str(damage)
	get_parent().add_child(new_lb)
	new_lb.global_position = global_position

func apply_knockback(direction : Vector2, force : float):
	knockback_velocity = direction * force

func die():
	queue_free()
	
func _on_detection_area_body_entered(body: Node2D) -> void:
	if body is Player:
		player_ref = body

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body is Player:
		player_ref = null

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is Player:
		can_attack = true

func _on_attack_area_body_exited(body: Node2D) -> void:
	if body is Player:
		can_attack = false

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.name == "PlayerHurtbox":
		area.get_parent().take_damage(base_dmg)
