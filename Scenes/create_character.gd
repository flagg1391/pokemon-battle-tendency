extends Node2D

var save_path = "user://savegame.save"



func _on_female_pressed() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Global.playergender)


func _on_male_pressed() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
