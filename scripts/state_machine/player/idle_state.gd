extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var stamp_effect_position: Marker2D = $"../../StampEffectPosition"

var dir : int = 1
var last_dir : int = 0

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	player.velocity.x = 0
	update_animation()
	
func physics_update(delta):
	dir = Input.get_axis("left", "right")
	if dir != 0:
		last_dir = dir
		$"../WalkState".dir = dir
		state_machine.change_state(state_machine.get_node("WalkState"))
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		$"../JumpState".dir = dir
		state_machine.change_state(state_machine.get_node("JumpState"))
	if Input.is_action_just_pressed("use_stamp"):
		$"../UseStampState".jumping = false
		$"../UseStampState".dir = dir
		state_machine.change_state(state_machine.get_node("UseStampState"))
	if Input.is_action_just_pressed("basic_attack"):
		$"../BasicAttackState".dir = last_dir
		state_machine.change_state(state_machine.get_node("BasicAttackState"))
	
func update_animation():
	if dir > 0:
		animated_sprite_2d.flip_h = false
		stamp_effect_position.position.x = 40
	elif dir < 0:
		animated_sprite_2d.flip_h = true
		stamp_effect_position.position.x = -40
	
	animated_sprite_2d.play("idle")
