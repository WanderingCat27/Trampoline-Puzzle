extends CharacterBody2D



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not visible:
		return
	# Add the gravity.
	velocity.y += gravity * delta
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal()) 

func _draw():
	draw_arc(Vector2.ZERO, 15, 0, 2*PI, 200, Color("6F1B45"), 30, true)
