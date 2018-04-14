extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var GROUP_PIPES = "pipes"
var GROUP_GROUNDS = "ground"
var GROUP_BIRD = "bird"

var score_best = 0 setget _set_score_best
var score_curent = 0 setget _set_score_current

signal score_best_changed
signal score_current_changed 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _set_score_current(new_value):
	score_curent = new_value
	emit_signal("score_current_changed")
	pass

func _set_score_best(new_value):
	score_best = new_value
	emit_signal("score_best_changed")
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
