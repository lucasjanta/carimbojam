extends Control
@onready var gramps: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/gramps
@onready var grampeadores_points: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/GrampeadoresPoints
@onready var contrs: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/contrs
@onready var contratos_points: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/ContratosPoints
@onready var tempo: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer3/tempo
@onready var tempo_points: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer3/TempoPoints
@onready var final_points: Label = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer4/FinalPoints


func pop_info():
	gramps.text = str(Global.grampeadores)
	contrs.text = str(Global.contratos)
	grampeadores_points.text = str(Global.grampeadores * 100)
	contratos_points.text = str(Global.contratos * 150)
	tempo.text = str(int(Global.time_elapsed)) + "s"
	tempo_points.text = str(Global.time_bonus)
	final_points.text = str(Global.score)
