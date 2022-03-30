extends Control

#The int "number" that will be saved/loaded.
export(int) var number = 0

func _process(delta):
	#Setting the label text to tne int "number".
	$Label.text = str(number)
	pass

func _on_Add_pressed():
	#Adding 1 to int "number".
	number += 1
	pass

func _on_Remove_pressed():
	#Removing 1 from int "number".
	number -= 1
	pass

func _on_Save_pressed():
	#Saving int "number" into the "slot1" of the dictionary "data".
	$SaveNode.data["slot1"] = number
	#Saving the dictionary "data" as a file at "c:/save.data".
	$SaveNode.saveData()
	pass

func _on_Load_pressed():
	#Loading the dictionary "data" from a file at "c:/save.data".
	$SaveNode.loadData()
	#Checking for the "slot1" of the dictionary "data". If used without checking and there is no save. -> Crash
	if $SaveNode.data.has("slot1"):
		#Loading "slot1" of the dictionary "data" into int "number" into the .
		number = $SaveNode.data["slot1"]
	pass
