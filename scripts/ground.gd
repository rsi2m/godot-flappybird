extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var bottom_right = get_node("bottom_right")
onready var camera = utils.get_main_node().get_node("camera")
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if bottom_right.global_position.x <= camera.get_total_pos().x:
		queue_free()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
