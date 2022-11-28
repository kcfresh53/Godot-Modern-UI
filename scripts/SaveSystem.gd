extends Node

#default application values
const DEFAULT_USERNAME = ""
const AUTO_SAVE = "off"


#autosave values
var autosave_length : int = 5
var autosave_start_time = 0 # 60 = 1 min


#dictionary values
var savedata : Dictionary

var username = ""

var autosave = "off"



func update_data():
	savedata = { "user_data" :
		{
			"name" : username
		},
		"settings" :
			{
				"autosave" : autosave
			}
	}



func do_save():
	update_data()
	var file : File = File.new() # new file
# warning-ignore:return_value_discarded
	file.open("res://saves/saves.dat",File.WRITE) #makes one if doesn't exist
	file.store_line(to_json(savedata)) # store dictionary as json
	file.close() #Finished so close file



func do_load() -> bool:
	var file : File = File.new() # new file
	if(file.file_exists("res://saves/saves.dat")): # check file exists
# warning-ignore:return_value_discarded
		file.open("res://saves/saves.dat",File.READ) #open file
		
		savedata = parse_json(file.get_as_text()) #parse json into a dictionary
		
		file.close() # close file
		
		#Load the data
		var settings_data = savedata["settings"]
		var user_data = savedata["user_data"]
		
		#Apply loaded data
		SaveSystem.username = user_data["user_data"]
		SaveSystem.autosave = settings_data["autosave"]
		
		
		return true
	else:
		return false



func _process(_delta):
	if autosave == "on":
		autosave_logic()



func autosave_logic():
	#Remove start time from the current time returns secs
	var time_passed = OS.get_unix_time() - autosave_start_time
	
	
	#If secs are greater than our auto length * 60 (aka mins)
	if(time_passed > (autosave_length * 60)): 
		do_save() # save
		
		#Reset the start_time so it loops
		autosave_start_time = OS.get_unix_time()



func reset_values():
	username = DEFAULT_USERNAME
	autosave = AUTO_SAVE



