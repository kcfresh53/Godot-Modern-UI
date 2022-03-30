extends Button


export var Icon = preload("res://images/svg_images/menu_icon.svg")
export var tab_name = ""
export var active = false

onready var texture = $HBoxContainer/VBoxContainer/TextureRect
onready var left_indicator = $indicator
onready var right_indicator = $rIndicator
onready var title = $HBoxContainer/Label



func _ready():
# warning-ignore:return_value_discarded
	SignalBus.connect("expand", self, "_on_expand_received")
	
	texture.texture = Icon
	title.text = tab_name



func _process(_delta):
	# controls the indicator visibility
	if active == true:
		left_indicator.visible = true
		right_indicator.visible = true
	else:
		left_indicator.visible = false
		right_indicator.visible = false



func _on_expand_received():
	if title.visible == false:
		title.visible = true
	else:
		title.visible = false



func _on_Tab_pressed():
	SignalBus.emit_signal("tab_active", tab_name)
	
	
	var tabs = get_tree().get_nodes_in_group("tab")
	for node in tabs:
		node.deactive()
	set_active()


func set_active():
	active = true


func deactive():
	active = false


