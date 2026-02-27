extends State
@onready var stamp_effect_position: Marker2D = $"../../StampEffectPosition"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var dir : int = 1
var last_dir : int = 0

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
	if dir != 0:
		last_dir = dir
	player.velocity.x = dir * player.speed
	if dir > 0:
		animated_sprite_2d.flip_h = false
		stamp_effect_position.position.x = 40
	elif dir < 0:
		animated_sprite_2d.flip_h = true
		stamp_effect_position.position.x = -40
	if player.is_on_floor():
		$"../IdleState".last_dir = last_dir
		state_machine.change_state(state_machine.get_node("IdleState"))
	if Input.is_action_just_pressed("use_stamp"):
		$"../UseStampState".dir = dir
		$"../UseStampState".jumping = true
		state_machine.change_state(state_machine.get_node("UseStampState"))
	if Input.is_action_just_pressed("basic_attack"):
		$"../BasicAttackState".dir = last_dir
		state_machine.change_state(state_machine.get_node("BasicAttackState"))
	
func update_animation():
	animated_sprite_2d.play("jump")
