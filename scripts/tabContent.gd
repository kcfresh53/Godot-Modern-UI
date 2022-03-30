extends VBoxContainer


export var tab_name = ""


func _ready():
# warning-ignore:return_value_discarded
	SignalBus.connect("tab_active", self, "_on_tab_active")



func _on_tab_active(tab):
	if tab_name == tab:
		visible = true
	else:
		visible = false
