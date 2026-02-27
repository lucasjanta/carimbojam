extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var hit_collision: CollisionShape2D = $"../../Hitbox/CollisionShape2D"

var dir : int = 0

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	update_animation()
	player.velocity.y = -150
	hit_collision.disabled = false
	
func physics_update(delta):
	player.velocity.x = dir * player.speed
	
func update_animation():
	animated_sprite_2d.play("atack")
	if dir > 0:
		animated_sprite_2d.flip_h = false
	elif dir < 0:
		animated_sprite_2d.flip_h = true

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "atack":
		hit_collision.disabled = true
		state_machine.change_state(state_machine.get_node("WalkState"))
