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
	stage_manager.connect("stage_changed",self,"_on_stage_changed")
	pass
	
func _on_stage_changed():
	score_curent = 0
	pass
	
func _set_score_current(new_value):
	score_curent = new_value
	emit_signal("score_current_changed")
	pass

func _set_score_best(new_value):
	if new_value > score_best:
		score_best = new_value
		emit_signal("score_best_changed")
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
