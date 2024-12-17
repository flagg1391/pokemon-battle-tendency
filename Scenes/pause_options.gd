extends Control


@onready var option_button = $Screen as OptionButton
var screen_size
var window_size


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
			
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			screen_size = DisplayServer.screen_get_size()
			window_size = DisplayServer.window_get_size()
			DisplayServer.window_set_position(screen_size*0.5 - window_size*0.5)


func _on_screen_item_selected(index: int) -> void:
	pass # Replace with function body.
