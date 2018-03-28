extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	pass
#	print('yolo')
	
func _input(event):
	if event !is InputEventKey: return
	if event.scancode == KEY_SPACE and event.is_pressed():
			print('input')

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
