extends PanelContainer

@export var score_group : Control
var stars : int

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level_won.connect(_on_win)
	visible = false

func _process(delta):
	if visible:
		time+= delta
		print(int(time) % 2)
		if time > 0.5 and stars > 0:
			time = 0
			score_group.get_child(stars-1).visible = true
			stars-=1
			

func _on_win():
	visible = true
	time = 0
	stars = int(LevelStats.time_score() + LevelStats.bounce_score() + LevelStats.trampoline_score())
	stars = min(stars, 3)
	for child in  score_group.get_children():
		child.visible = false
		
