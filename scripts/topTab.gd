extends ColorRect



var following = false
var dragging_start_position = Vector2()

onready var maximizeBtn = $controlBar/maximizeBtn


func _on_topTab_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()



func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)



func _on_minimizeBtn_pressed():
	OS.set_window_minimized(true)



func _on_closeBtn_pressed():
	get_tree().quit()



func _on_maximizeBtn_pressed():
	if OS.is_window_maximized():
		OS.set_window_maximized(false)
		maximizeBtn.Icon = preload("res://images/svg_images/maximize_icon.svg")
	else:
		OS.set_window_maximized(true)
		maximizeBtn.Icon = preload("res://images/svg_images/restore_icon.svg")
