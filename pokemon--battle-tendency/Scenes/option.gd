extends Node2D


@onready var option_button = $Screen as OptionButton


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

const window_mode_array : Array[String] = [
	"Оконный режим",
	"Полный экран",
]

func _ready():
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)
	
	
func add_window_mode_items() -> void:
	for window_mode in window_mode_array:
		option_button.add_item(window_mode)

func on_window_mode_selected(index: int) -> void:
	match index:
		0: #Оконный режим
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		1: #Полный экран
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
