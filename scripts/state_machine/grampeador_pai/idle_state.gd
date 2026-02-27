extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var dir : int = 0
var idle_cooldown := 0.8

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	update_animation()
	idle_cooldown = 0.8
	player.velocity.x = 0.0
	
func physics_update(delta):
	if idle_cooldown > 0.0:
		idle_cooldown -= delta
	else:
		if player.can_attack:
			$"../AttackState".dir = dir
			state_machine.change_state(state_machine.get_node("AttackState"))
		else:
			state_machine.change_state(state_machine.get_node("WalkState"))
		
	
func update_animation():
	animated_sprite_2d.play("idle")
	if dir > 0:
		animated_sprite_2d.flip_h = false
	elif dir < 0:
		animated_sprite_2d.flip_h = true
	
