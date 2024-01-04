extends Button

func _pressed():
	get_tree().reload_current_scene()
	Global.CURR_MODE = Global.Mode.DRAWING
