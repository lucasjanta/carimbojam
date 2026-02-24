extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var dir : int = -1

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	update_animation()

func physics_update(delta):
	update_animation()
	if player.player_ref != null:
		var direction = (player.player_ref.global_position - player.global_position).normalized()
		player.velocity = direction * player.follow_speed
		player.rotation = direction.angle()
	else:
		state_machine.change_state(state_machine.get_node("IdleState"))
	
	if player.can_attack:
		state_machine.change_state(state_machine.get_node("AttackState"))
		
func update_animation():
	if player.velocity.x > 0:
		#animated_sprite_2d.flip_h = false
		animated_sprite_2d.flip_v = false
	elif player.velocity.x < 0:
		#animated_sprite_2d.flip_h = true
		animated_sprite_2d.flip_v = true
	animated_sprite_2d.play("follow")
