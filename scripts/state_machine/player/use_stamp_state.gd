extends State
@onready var stamp_effect_position: Marker2D = $"../../StampEffectPosition"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var dir : int = 0
var jumping := false

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	update_animation()

func physics_update(delta):
	dir = Input.get_axis("left", "right")
	player.velocity.x = dir * player.speed
	#if Input.is_action_just_pressed("jump") and !jumping:
		#player.velocity.y += player.jump_force
		#jumping = true
		
func update_animation():
	if dir > 0:
		animated_sprite_2d.flip_h = false
		stamp_effect_position.position.x = 40
	elif dir < 0:
		animated_sprite_2d.flip_h = true
		stamp_effect_position.position.x = -40
	animation_player.play("heavy_atk")

func use_stamp():
	player.carimbo_manager.use_current_stamp()

func next_state():
	$"../IdleState".dir = dir
	state_machine.change_state(state_machine.get_node("IdleState"))
