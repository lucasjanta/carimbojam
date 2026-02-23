extends PanelContainer

@onready var texture_rect: TextureRect = $TextureRect
@onready var nome_carimbo: Label = $VBoxContainer/NomeCarimbo

var description : String = ""
var cooldown : float = 0.0
