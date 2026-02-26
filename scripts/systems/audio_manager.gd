extends Node2D
@onready var menu_music: AudioStreamPlayer = $MenuMusic
@onready var level_1_music: AudioStreamPlayer = $Level1Music
@onready var level_2_music: AudioStreamPlayer = $Level2Music
@onready var level_3_music: AudioStreamPlayer = $Level3Music

func play_menu_music():
	stop_all_music()
	menu_music.play()
	
func play_level1_music():
	stop_all_music()
	level_1_music.play()
	
func play_level2_music():
	stop_all_music()
	level_2_music.play()
	
func play_level3_music():
	stop_all_music()
	level_3_music.play()
	
func stop_all_music():
	menu_music.stop()
	level_1_music.stop()
	level_2_music.stop()
	level_3_music.stop()
