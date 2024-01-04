extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = ""
	text += "Trampoline Count: " + str(LevelStats.trampolines_used) + " / " + str(LevelStats.trampolines_goal) + " / " + str(LevelStats.trampolines_max) 
	text += "\nTime: " + str(LevelStats.time).pad_decimals(2) + " / " + str(LevelStats.goal_time)
	text += "\nBounces: " + str(LevelStats.total_bounces) + " / " + str(LevelStats.goal_bounces)
