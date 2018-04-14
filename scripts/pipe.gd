extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var right = get_node("right")
onready var camera = utils.get_main_node().get_node("camera")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	add_to_group(game.GROUP_PIPES)
	pass

func _process(delta):
	if camera == null: return
	
	if right.global_position.x <= camera.get_total_pos().x:
		print(right.position)
		queue_free()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
