extends Area2D

@export var coin : Node2D

var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	position = coin.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if int(time) % 2 == 0:
		visible = !visible

func _draw():
	draw_circle(Vector2.ZERO, 30, Color("06d6a0", 0.25))




func _on_body_entered(body):
	if body.is_in_group("ball"):
		queue_free()
