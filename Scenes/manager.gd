extends Node
var save_path = "res://savegame.save"
var game_paused: bool = false
@onready var pause_menu = $"../CanvasLayer/Pause"
@onready var player = $"../PlayerMale"
@onready var options = $"../CanvasLayer/Pause/Panel/VBoxContainer/Options/pause_options"
func _ready() -> void:
	if FileAccess.file_exists(save_path):
		load_game()
	options.visible = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
	if game_paused == false:
		get_tree().paused = false
		pause_menu.hide()
func _on_resume_pressed():
	game_paused = !game_paused
func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
func _on_options_pressed() -> void:
	options.visible = !options.visible
func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(player.position.x)
	file.store_var(player.position.y)
func load_game():
	var file = FileAccess.open(save_path, FileAccess.READ)
	player.position.x = file.get_var(player.position.x)
	player.position.y = file.get_var(player.position.y)
func _on_save_pressed() -> void:
	save_game()
