extends StaticBody2D

@export var size : Vector2 = Vector2(100,300)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).shape.size = size
	
func _draw():
	draw_rect(Rect2(Vector2.ZERO-size/2, size), Color.ANTIQUE_WHITE, true)
