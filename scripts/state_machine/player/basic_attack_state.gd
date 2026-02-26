extends State
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var basic_attack_area: Area2D = $"../../BasicAttackArea"

var dir : int = 0

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	update_animation()
	

func physics_update(delta):
	dir = Input.get_axis("left", "right")
	player.velocity.x = dir * (player.speed / 2)
		
func update_animation():
	if dir > 0:
		animated_sprite_2d.flip_h = false
		basic_attack_area.position.x = 27.0
	elif dir < 0:
		animated_sprite_2d.flip_h = true
		basic_attack_area.position.x = -27.0
		
	animation_player.play("basic_attack")

func end_attack():
	state_machine.change_state(state_machine.get_node("IdleState"))
