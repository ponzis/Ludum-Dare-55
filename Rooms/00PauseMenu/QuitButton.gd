extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(_on_pressed)
	pass # Replace with function body.

func _on_pressed():
	get_tree().quit()
