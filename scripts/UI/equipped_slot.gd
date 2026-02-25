extends PanelContainer

@onready var texture_rect: TextureRect = $TextureRect
@onready var nome_carimbo: Label = $VBoxContainer/NomeCarimbo
@onready var progress_bar: ProgressBar = $ProgressBar

var description : String = ""
var cooldown : float = 0.0

func update_progress_bar(cd_value):
	progress_bar.value = cd_value
