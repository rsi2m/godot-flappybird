extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var bird = utils.get_main_node().get_node("bird")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	position = Vector2(bird.position.x, position.y)
	pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
