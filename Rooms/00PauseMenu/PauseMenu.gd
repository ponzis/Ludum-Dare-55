extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			self.hide()
			get_tree().paused = false
		else:
			self.show()
			get_tree().paused = true