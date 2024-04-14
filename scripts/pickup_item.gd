extends "res://scripts/item.gd"

@export var required_pickup_flags := {}

@export var set_flags_on_pickup := {}

func _ready():
	super()
	pressed.connect(_on_pressed)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Maybe add a replace node to it...

func _on_pressed():
	if check_conditions(required_pickup_flags):
		set_flags(set_flags_on_pickup) # Set the relevant flags
		self.hide() #Hide the picked up item
	pass # Replace with function body.

