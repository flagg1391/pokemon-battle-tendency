extends Node
var game_paused: bool = false

@onready var pause_menu = $"../CanvasLayer/Pause"


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
	if game_paused == false:
		get_tree().paused = false
		pause_menu.hide()


func _on_resume_pressed() -> void:
	game_paused = !game_paused


func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	



func _on_options_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/option.tscn")
