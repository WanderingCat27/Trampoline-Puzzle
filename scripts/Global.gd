extends Node

enum Mode {DRAWING, INACTIVE_ERASING, ACTIVE_ERASING, PLAYING, WON}

var current_scene 

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() -1)

signal coin_collected()
signal set_score(int)
signal level_goal_entered()
signal set_timer_active(bool)

signal restart_level()
signal start_level()
signal stop_level()
signal level_won()

var CURR_MODE = Mode.DRAWING

func load_scene(scene : PackedScene):
	current_scene.queue_free()
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	
func refresh_mode():
	CURR_MODE = Mode.DRAWING
