extends Node2D

@export var ball : Node2D
@export var coin_group : Node2D
@export var trampoline_group : Node2D
@export var goal : Node2D
@export var spawnPosition : Vector2 = Vector2(100,100)


@export var goal_trampolines : int
@export var max_trampolines : int
@export var goal_time : int
@export var goal_bounces : int

var goal_open_color = Color("06d6a0")
var goal_closed_color = Color("ef476f")

var prevMode : Global.Mode
var coin_goal : int
var score = 0


func _ready():
	Global.CURR_MODE = Global.Mode.DRAWING
	Global.coin_collected.connect(_collect)
	Global.level_goal_entered.connect(_goal_entered)
	
	Global.start_level.connect(start)
	Global.stop_level.connect(stop)
	ball.visible = false
	
	coin_goal = coin_group.get_child_count()
	
	LevelStats.set_goals(goal_trampolines, max_trampolines, goal_time, goal_bounces)
	
	

func _collect():
	score+=1
	refresh_score()
	
func _goal_entered():
	if score >= coin_goal:
		level_won()

func level_won():
	ball.visible = false
	Global.CURR_MODE = Global.Mode.WON
	Global.set_timer_active.emit(false)
	Global.level_won.emit()

func refresh_score():
	Global.set_score.emit(score)


func _unhandled_key_input(event):
	if event.is_action_pressed("restart"):
		stop()
		for tramp in trampoline_group.get_children():
			tramp.queue_free()
		
func start():
	LevelStats.total_bounces = 0
	
	prevMode = Global.CURR_MODE
	Global.CURR_MODE = Global.Mode.PLAYING
	Global.set_timer_active.emit(true)
	ball.visible = true
	ball.position = spawnPosition
	ball.velocity = Vector2.ZERO
	score = 0
	refresh_score()
	for child in coin_group.get_children():
		child.visible = true
	Global.restart_level.emit()
	
	
func stop():
	LevelStats.total_bounces = 0
	Global.CURR_MODE = prevMode
	Global.set_timer_active.emit(false)
	ball.visible = false
	score = 0
	refresh_score()
	for child in coin_group.get_children():
		child.visible = true
	
	
func _process(delta):
	queue_redraw()
	

func _draw():
	var size = Vector2(100,100)
	var color = goal_closed_color
	if score >= coin_goal:
		color = goal_open_color
		
	draw_rect(Rect2(spawnPosition - size/2, size),Color("118ab2"),true)
	
	draw_rect(Rect2(goal.position-size/2, size), color, true)
