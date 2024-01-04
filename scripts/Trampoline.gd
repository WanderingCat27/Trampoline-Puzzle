extends Line2D

var normal
@export var bounce_strength = -700
func set_line_points(one : Vector2, two : Vector2):
	points = PackedVector2Array([one, two])
	normal = Vector2(-(two.y-one.y),two.x -one.x ).normalized()
	var w = normal *width/2
	$StaticBody2D/CollisionShape2D.shape.points = PackedVector2Array([one+w,one-w,two-w,two+w])




func _on_static_body_2d_body_entered(body):
	if body.is_in_group("ball"):
		LevelStats.total_bounces += 1
		body.velocity = body.velocity.bounce(normal)
		if body.velocity.y < 0:
			body.velocity.y = bounce_strength
		else:
			body.velocity.y = -bounce_strength 
