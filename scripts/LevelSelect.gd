extends Control

@export var levelButton : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	for index in range(0, Levels.levels.size()):
		var button = levelButton.instantiate()
		$CenterContainer/GridContainer.add_child(button)
		button.levelIndex = index
		button.text = str(index)
		
