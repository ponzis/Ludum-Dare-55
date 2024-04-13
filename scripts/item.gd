extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var text = get_node('.').get_texture_normal()
	var height = text.get_height()
	var width = text.get_width()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
