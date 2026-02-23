extends CharacterBody2D
class_name Enemy
@onready var dmg_anim: AnimationPlayer = $DmgAnim
@onready var damage_label: Label = $DamageLabel

@export var max_hp := 100.0
var hp := 0.0
var knockback_velocity := Vector2.ZERO
@export var speed := 300.0

func _ready() -> void:
	hp = max_hp

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += 900 * delta
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
	damage_label.text = "-" + str(damage)
	dmg_anim.play("hit")

func apply_knockback(direction : Vector2, force : float):
	knockback_velocity = direction * force

func die():
	queue_free()
