extends Button

@export var levelIndex : int = 0

func _pressed():
	get_tree().change_scene_to_file(Levels.levels[levelIndex])
	Global.refresh_mode()
