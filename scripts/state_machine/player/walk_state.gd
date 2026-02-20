extends State

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var dir : int = 1

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	update_animation()

func physics_update(delta):
	dir = Input.get_axis("left", "right")
	player.velocity.x = dir * player.speed
	update_animation()
	if dir == 0:
		state_machine.change_state(state_machine.get_node("IdleState"))
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state(state_machine.get_node("JumpState"))
		
func update_animation():
	if dir > 0:
		animated_sprite_2d.flip_h = false
	elif dir < 0:
		animated_sprite_2d.flip_h = true
	animated_sprite_2d.play("walk")
