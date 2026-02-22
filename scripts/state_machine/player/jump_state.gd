extends State

@onready var carimbo_collision: Area2D = $"../../CarimboCollision"
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
		carimbo_collision.position.x = 41
	elif dir < 0:
		animated_sprite_2d.flip_h = true
		carimbo_collision.position.x = -41
	if player.is_on_floor():
		$"../IdleState".dir = dir
		state_machine.change_state(state_machine.get_node("IdleState"))
		
func update_animation():
	animated_sprite_2d.play("jump")
