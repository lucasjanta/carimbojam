extends State

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var dir : int = 1

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	player.velocity.y = player.jump_force
	update_animation()
	

func physics_update(delta):
	dir = Input.get_axis("left", "right")
	player.velocity.x = dir * player.speed
	if player.is_on_floor():
		state_machine.change_state(state_machine.get_node("IdleState"))
		
func update_animation():
	if dir > 0:
		animated_sprite_2d.flip_h = false
	elif dir < 0:
		animated_sprite_2d.flip_h = true
	animated_sprite_2d.play("jump")
