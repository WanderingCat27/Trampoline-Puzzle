extends Node2D


# Called when the node enters the scene tree for the first time.
func _process(delta):
	$right.position.x = get_viewport_rect().size.x + 20
	$left.position.x = -20
