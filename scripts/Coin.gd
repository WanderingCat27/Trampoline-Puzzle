extends Area2D

func _on_body_entered(body):
	if visible and body.is_in_group("ball"):
		visible = false
		Global.coin_collected.emit()
		
func _draw():
	draw_arc(Vector2.ZERO, 6, 0, 2*PI, 200, Color("ffd166"), 20, true)
