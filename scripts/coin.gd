extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("body_entered", self, "on_body_enter")
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func on_body_enter(other_body):
	if other_body.is_in_group(game.GROUP_BIRD):
		game.score_curent += 1
		pass
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
