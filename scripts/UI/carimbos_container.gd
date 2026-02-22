extends GridContainer
@onready var title_label: Label = $"../DescriptionContainer/MarginContainer/VBoxContainer/TitleLabel"
@onready var description_label: Label = $"../DescriptionContainer/MarginContainer/VBoxContainer/descriptionLabel"
@onready var cooldown_label: Label = $"../DescriptionContainer/MarginContainer/VBoxContainer/HBoxContainer/CooldownLabel"

func update_description(title : String, description : String, cooldown : float):
	title_label.text = title
	description_label.text = description
	cooldown_label.text = str(cooldown)
