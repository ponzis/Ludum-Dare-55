extends TextureButton

var test:TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	test = get_node(".")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var clickmask: BitMap = BitMap.new()
	clickmask.create_from_image_alpha(test.texture_normal.get_image())
	test.texture_click_mask = clickmask
	#test.
	#test.texture_normal.get_image()
