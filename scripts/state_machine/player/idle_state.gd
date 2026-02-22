extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var carimbo_collision: Area2D = $"../../CarimboCollision"

var dir : int = 1

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	player.velocity.x = 0
	update_animation()
	
func physics_update(delta):
	dir = Input.get_axis("left", "right")
	if dir != 0:
		$"../WalkState".dir = dir
		state_machine.change_state(state_machine.get_node("WalkState"))
	if Input.is_action_just_pressed("jump"):
		$"../JumpState".dir = dir
		state_machine.change_state(state_machine.get_node("JumpState"))
	
func update_animation():
	if dir > 0:
		animated_sprite_2d.flip_h = false
		carimbo_collision.position.x = 41
	elif dir < 0:
		animated_sprite_2d.flip_h = true
		carimbo_collision.position.x = -41
	
	animated_sprite_2d.play("idle")
