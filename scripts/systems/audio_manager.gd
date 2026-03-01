extends Node2D
@onready var menu_music: AudioStreamPlayer = $MenuMusic
@onready var level_1_music: AudioStreamPlayer = $Level1Music

func play_menu_music():
	stop_all_music()
	menu_music.play()
	
func play_level1_music():
	stop_all_music()
	level_1_music.play()

	
func stop_all_music():
	menu_music.stop()
	level_1_music.stop()
	
