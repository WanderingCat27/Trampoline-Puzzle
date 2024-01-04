extends Node2D

func _unhandled_input(event):
	var pos = Vector2(-100,-100)
	if Global.CURR_MODE ==  Global.Mode.INACTIVE_ERASING or Global.CURR_MODE ==  Global.Mode.ACTIVE_ERASING:
		if event.is_action_pressed("click"):
			Global.CURR_MODE = Global.Mode.ACTIVE_ERASING
		elif event.is_action_released("click"):
			Global.CURR_MODE =  Global.Mode.INACTIVE_ERASING
		if Global.CURR_MODE == Global.Mode.ACTIVE_ERASING:
			pos = get_global_mouse_position()

	position = pos


func _on_area_entered(area):
	if area.is_in_group("trampoline"):
		area.get_parent().queue_free()
		LevelStats.trampolines_used -= 1
