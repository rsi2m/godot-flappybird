extends CanvasLayer

const STAGE_GAME = "res://stages/gameStage.tscn"
const STAGE_MENU = "res://stages/menu_stage.tscn"

var is_changing = false

signal stage_changed

func _ready():
	pass
	
func change_stage(stage_path):
	if is_changing: return
	
	is_changing = true
	get_tree().get_root().set_disable_input(true)
	
	get_node("anim").play("fade_in")
	audio_player.get_node("swoosh").play()
	yield(get_node("anim"),"animation_finished")
	
	get_tree().change_scene(stage_path)
	emit_signal("stage_changed")
	
	get_node("anim").play("fade_out")
	yield(get_node("anim"),"animation_finished")
	is_changing = false
	get_tree().get_root().set_disable_input(false)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
