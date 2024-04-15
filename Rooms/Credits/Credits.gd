extends Node2D

var SPEED = 1
var gravity = 9.2
var velo = 0
var falling = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$BG.rotation+= delta
	velo+= (gravity*delta*falling) - (SPEED*delta)
	$Credits.position.y += velo
	if $Credits.position.y < 0:
		falling = 1
		SPEED = 0
		#$Credits.position.y = 1080
	if $Credits.position.y > 1080+50:
		$Credits.position.y = 1080+50
		velo=0
		falling = 0
		SPEED = 1
