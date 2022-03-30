extends Node

export var filePath = "c:/"
export var fileName = "save"
export var fileFormat = ".data"

var saveFile = filePath+fileName+fileFormat

export var data = {
	"saveSlot1": {},
	"saveSlot2": {},
	"saveSlot3": {}
}

#func _ready():
#	loadData()
#	pass

#func _process(delta):
#	saveData()
#	pass

func loadData():
	var file = File.new()
	if file.file_exists(saveFile):
		file.open(saveFile, File.READ)
		data = file.get_var()
		file.close()
	pass

func saveData():
	var file = File.new()
	file.open(saveFile, File.WRITE)
	file.store_var(data)
	file.close()
	pass
