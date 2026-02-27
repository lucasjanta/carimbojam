extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var dir : int = 0
var idle_cooldown := 1.0

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	dir = [-1,1].pick_random()
	update_animation()
	
func physics_update(delta):
	if player.global_position.x > player.right_limit.global_position.x:
		dir = -1
	if player.global_position.x < player.left_limit.global_position.x:
		dir = 1
	update_animation()
	player.velocity.x = dir * player.speed
	if player.can_attack:
		$"../IdleState".dir = dir
		state_machine.change_state(state_machine.get_node("IdleState"))

	
func update_animation():
	animated_sprite_2d.play("run")
	if dir > 0:
		animated_sprite_2d.flip_h = false
	elif dir < 0:
		animated_sprite_2d.flip_h = true
	
