extends PanelContainer


func _unhandled_key_input(event):
	if event.is_action_pressed("esc"):
		visible = !visible


func _on_resume_pressed():
	visible = false


func _on_quit_pressed():
	get_tree().change_scene_to_file(Levels.LevelSelect)


func _on_settings_pressed():
	pass # Replace with function body.
