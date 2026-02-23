extends PanelContainer
@onready var life_bar: TextureProgressBar = $MarginContainer/HBoxContainer/VBoxContainer/LifeBar
@onready var buffs_container: HBoxContainer = $MarginContainer/HBoxContainer/VBoxContainer/BuffsContainer

func update_ui(max_hp : float, hp : float):
	life_bar.max_value = max_hp
	life_bar.value = hp
	
