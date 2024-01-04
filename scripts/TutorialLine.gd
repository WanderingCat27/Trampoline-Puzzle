extends Line2D

@export var pointOne = Vector2(50, 250)
@export var pointTwo = Vector2(150,350)
var time = 0
var active = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not active: return
	time += delta
	var end = pointOne + Vector2(pointTwo.x-pointOne.x, pointTwo.y-pointOne.y) * (int(time *100) % 100)/100
	points = PackedVector2Array([pointOne, end])


func _on_area_2d_area_entered(area):
	if area.is_in_group("trampoline"):
		active = false
		visible = false


func _on_area_2d_area_exited(area):
	if area.is_in_group("trampoline"):
		active = true
		visible = true
