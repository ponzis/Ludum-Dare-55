extends "res://scripts/item.gd"

#flags to check
#@export var 

#Set flags on events...

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.game_manager.game_flags)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
