extends Node2D

var anim_player  : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player= $AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	anim_player.play("new_animation")
