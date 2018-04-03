

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
extends Node

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func get_main_node():
	var root_node = get_tree().get_root()
	return root_node.get_child(root_node.get_child_count()-1)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
