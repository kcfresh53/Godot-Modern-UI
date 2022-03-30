tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("SaveNode", "Node", preload("res://addons/saveNode/scripts/saveNode.gd"), preload("res://addons/saveNode/icons/icon.svg"))
	pass

func _exit_tree():
	remove_custom_type("SaveNode")
	pass
