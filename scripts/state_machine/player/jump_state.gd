extends State
@onready var stamp_effect_position: Marker2D = $"../../StampEffectPosition"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var dir : int = 1

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	if player.is_on_floor():
		player.velocity.y += player.jump_force
	else:
		player.velocity.y = player.jump_force
	update_animation()
	

func physics_update(delta):
	dir = Input.get_axis("left", "right")
	player.velocity.x = dir * player.speed
	if dir > 0:
		animated_sprite_2d.flip_h = false
		stamp_effect_position.position.x = 40
	elif dir < 0:
		animated_sprite_2d.flip_h = true
		stamp_effect_position.position.x = -40
	if player.is_on_floor():
		$"../IdleState".dir = dir
		state_machine.change_state(state_machine.get_node("IdleState"))
	if Input.is_action_just_pressed("use_stamp"):
		$"../UseStampState".dir = dir
		state_machine.change_state(state_machine.get_node("UseStampState"))
	
func update_animation():
	animated_sprite_2d.play("idle")
