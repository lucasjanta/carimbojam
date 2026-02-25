extends Area2D

@onready var tutorial_container: Control = $CanvasLayer/TutorialContainer
@onready var title_label: Label = $CanvasLayer/TutorialContainer/PanelContainer/MarginContainer/VBoxContainer/TitleLabel
@onready var description_label: Label = $CanvasLayer/TutorialContainer/PanelContainer/MarginContainer/VBoxContainer/DescriptionLabel
@onready var interact_label: Label = $InteractLabel

@export var tutorial_title : String
@export var tutorial_description : String

var can_interact := false

func _ready() -> void:
	update_sign()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact:
		tutorial_container.visible = !tutorial_container.visible

func update_sign():
	title_label.text = tutorial_title
	description_label.text= tutorial_description


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		interact_label.visible = true
		can_interact = true


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		interact_label.visible = false
		can_interact = false
		tutorial_container.visible = false
