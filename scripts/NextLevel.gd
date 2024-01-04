extends Button


func _pressed():
	var path = get_tree().current_scene.scene_file_path
	for index in range(0, Levels.levels.size()):
		if path == Levels.levels[index]:
			get_tree().change_scene_to_file(Levels.levels[index+1])
			return
