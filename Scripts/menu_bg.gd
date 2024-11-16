extends ParallaxBackground

var menu_speed = [0, 0, 0, 15, 30, 0, 45, 60]
var layers = []

func _ready():
	for i in range(get_child_count()):
		layers = get_children() 
		layers[i].motion_scale = Vector2(menu_speed[i], 0)

func _process(delta: float) -> void:
	for i in range(layers.size()):
		var cloud = layers[i]
		cloud.motion_offset.x -= menu_speed[i] * delta
