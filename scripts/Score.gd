extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.set_score.connect(_set_score)

func _set_score(score : int):
	text = str(score)
