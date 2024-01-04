extends Area2D

func _on_body_entered(body):
	if body.is_in_group("ball"):
		Global.level_goal_entered.emit()
