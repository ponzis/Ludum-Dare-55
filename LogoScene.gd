extends Node2D

var anim_player  : AnimationPlayer
var played_once = false
var default_mouse_mode
# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player= $AnimationPlayer
	default_mouse_mode = Input.mouse_mode
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not anim_player.is_playing() and not played_once:
		anim_player.play("new_animation")




func _on_animation_player_animation_finished(anim_name):
	played_once = true
	Input.mouse_mode = default_mouse_mode
	get_tree().change_scene_to_file("res://main.tscn")
