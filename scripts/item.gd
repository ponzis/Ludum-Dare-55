extends TextureButton

# We get a reference to game manager to handle persistent events
@onready var game_manager = get_node('/root/Main')

@export var crosshair:Resource = preload("res://crosshair_24.svg")
@export var grab:Resource = preload("res://grab_24.svg")

var clickmask: BitMap = BitMap.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Item %s ready" % self.name)
	Input.set_custom_mouse_cursor(crosshair)
	make_clip_mask()
	pass

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
	pass
	

func _on_mouse_exited():
	print("Exited")
	Input.set_custom_mouse_cursor(crosshair)
	pass
