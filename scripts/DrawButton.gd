extends Button

var active : bool = false
func _pressed():
	if Global.CURR_MODE == Global.Mode.PLAYING or Global.CURR_MODE == Global.Mode.WON:
		return
	active = !active
	if active:
		text = "Draw"
		Global.CURR_MODE = Global.Mode.INACTIVE_ERASING
	else:
		text = "Erase"
		Global.CURR_MODE = Global.Mode.DRAWING

