extends Control

onready var tab_area = $BG/body/activeArea/leftTab
onready var tween = $Tween
onready var active_tab_name = $BG/body/topTab/topTab/descriptionTab/HBoxContainer2/tabName
onready var line_edit = $BG/body/activeArea/contentArea/contentHolder/content1/inputsPanel/inputPanel/lineEdit
onready var welcome_label = $BG/body/activeArea/contentArea/contentHolder/content1/Panel/name


var name_input = ""



func _ready():
	get_tree().get_root().set_transparent_background(true)



func _process(_delta):
	tab_name_update()



func _on_tabBtn_toggled(button_pressed):
	if button_pressed:
		
		#animates the menu opening
		tween.interpolate_property(tab_area, "rect_min_size:x", 80 , 80 * 3, 0.125, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.start()
		
		SignalBus.emit_signal("expand")
	else:
		
		#animates the menu closing
		tween.interpolate_property(tab_area, "rect_min_size:x", 80 * 3, 80, 0.125, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		SignalBus.emit_signal("expand")



func tab_name_update():
	var tabs = get_tree().get_nodes_in_group("tab")
	
	for node in tabs:
		if node.active == true:
			active_tab_name.text = "| " + node.tab_name.to_upper()



func _on_Button_pressed():
	name_input = line_edit.get_text()
	welcome_label.text = "Welcome, " + name_input
