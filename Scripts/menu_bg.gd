extends ParallaxBackground

var menu_speed = 100

func _process(delta: float) -> void:
	scroll_offset.x -= menu_speed * delta
