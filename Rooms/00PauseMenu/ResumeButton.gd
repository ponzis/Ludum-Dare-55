extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	get_parent().hide()
	get_tree().paused = false
