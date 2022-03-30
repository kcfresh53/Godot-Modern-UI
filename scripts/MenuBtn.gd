extends Button

export var Icon = preload("res://images/svg_images/menu_icon.svg")

export var min_size_flag = Vector2(80, 80)


onready var texture = $Texture

func _ready():
	texture.texture = Icon
	
	self.rect_min_size = min_size_flag

func _process(_delta):
	texture.texture = Icon
