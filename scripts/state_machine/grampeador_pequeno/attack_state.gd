extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var dash_direction : Vector2
var dash_distance := 200
var start_position : Vector2
var dir : int = -1

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	update_animation()
	if player.player_ref != null:
		dash_direction = (player.player_ref.global_position - player.global_position).normalized()
		start_position = player.global_position
		
		player.rotation = dash_direction.angle()
	

func physics_update(delta):
	update_animation()
	player.velocity = dash_direction * player.attack_speed
	
	var traveled_distance = start_position.distance_to(player.global_position)
	
	if traveled_distance >= dash_distance:
		player.velocity = Vector2.ZERO
		state_machine.change_state(state_machine.get_node("FollowState"))
	
	
func update_animation():
	if player.velocity.x > 0:
		animated_sprite_2d.flip_v = false
	elif player.velocity.x < 0:
		animated_sprite_2d.flip_v = true
	
	animated_sprite_2d.play("follow")
