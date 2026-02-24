extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var dir : int = -1

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	player.velocity = Vector2.ZERO
	update_animation()
	
func physics_update(delta):
	if player.player_ref != null:
		state_machine.change_state(state_machine.get_node("FollowState"))
	
func update_animation():
	#if dir > 0:
		#animated_sprite_2d.flip_h = false
	#elif dir < 0:
		#animated_sprite_2d.flip_h = true
	
	animated_sprite_2d.play("idle")
