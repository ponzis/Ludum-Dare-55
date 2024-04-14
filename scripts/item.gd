extends TextureButton

# We get a reference to game manager to handle persistent events
@onready var game_manager = get_node('/root/Main')

@export var crosshair:Resource = preload("res://crosshair_24.svg")
@export var grab:Resource = preload("res://grab_24.svg")

@export var visibility_flags:= {}


func check_conditions(flags:Dictionary,ignore_missing = true, return_if_met = true):#TODO: Rename to check flags?
	if flags.is_empty() and ignore_missing:
		print("No flags set.")
		return return_if_met
	else:
		for flag in flags.keys():
			if game_manager.game_flags.has(flag):
				if game_manager.game_flags[flag] == flags[flag]:
					pass
				else:
					#Fail condition
					return not return_if_met
			else:
				if ignore_missing:
					pass #Skip if ignoring missing
				else:
					return not return_if_met #Else, autofail
	return return_if_met #since we got through the ladder we are confirmed.

func set_flags(flags:Dictionary):
	print("Setting Flags")
	for flag in flags.keys():
		print("	%s"%flag)
		game_manager.game_flags[flag]=flags[flag]


var clickmask: BitMap = BitMap.new()

# Called when the node enters the scene tree for the first time.
func _ready():#Onready overwrites the parents on ready
	print("Bepis")
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	print("Item %s ready" % self.name)
	if check_conditions(visibility_flags):
		self.show()
	else:
		self.hide()
	Input.set_custom_mouse_cursor(crosshair)
	make_clip_mask()


func make_clip_mask():
	if self.texture_normal == null:
		return
	var image = self.texture_normal.get_image()
	if image == null:
		return
	clickmask.create_from_image_alpha(image)
	self.texture_click_mask = clickmask

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	print("Enter")
	Input.set_custom_mouse_cursor(grab)
	

func _on_mouse_exited():
	print("Exited")
	Input.set_custom_mouse_cursor(crosshair)
