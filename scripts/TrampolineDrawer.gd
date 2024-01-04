extends Line2D

@export var trampoline : PackedScene
@export var trampoline_group : Node2D
@export var min_dist : int
@export var max_dist : int

@export var valid_color : Color
@export var invalid_color : Color

var start : Vector2
var end : Vector2
var valid : bool

var dragging = false
	
func _unhandled_input(event):
	if Global.CURR_MODE != Global.Mode.DRAWING:
		return
	if event.is_action_pressed("esc"):
		dragging = false
		visible = false
	var mpos = get_global_mouse_position()

	if event.is_action_pressed("click"):
		start = mpos
		end = mpos
		dragging = true
		valid = true
		visible = true
	elif event.is_action_released("click"):
		if dragging and valid and LevelStats.trampolines_used < LevelStats.trampolines_max:
			var tramp = trampoline.instantiate()
			LevelStats.trampolines_used += 1
			trampoline_group.add_child(tramp)
			tramp.set_line_points(start, end)
		dragging = false
		visible = false
		
	if dragging:
		points = PackedVector2Array([start, end])
		if start.distance_to(mpos) > max_dist:
			end = start + Vector2(mpos.x-start.x, mpos.y-start.y).normalized() * max_dist

		else:
			end = mpos
		if start.distance_to(end) > min_dist:
			default_color = valid_color
			valid = true
		else:
			default_color = invalid_color
			valid = false

	
	
