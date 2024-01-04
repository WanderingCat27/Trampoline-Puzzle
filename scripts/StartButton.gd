extends Button
var active : bool = false
func _pressed():
	if Global.CURR_MODE == Global.Mode.WON:
		return
	active = !active
	if active:
		text = "Stop"
		Global.start_level.emit()
	else:
		text = "Start"
		Global.stop_level.emit()
