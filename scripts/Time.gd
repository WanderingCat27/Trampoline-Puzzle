extends Label

var time = 0
var active = false

func _ready():
	Global.restart_level.connect(_restart)
	Global.set_timer_active.connect(_set_active)

func _process(delta):
	if active:
		time += delta
		LevelStats.time = time
	text = str(time).pad_decimals(2)	

func _restart():
	time = 0
	
func _set_active(_active : bool):
	active = _active
