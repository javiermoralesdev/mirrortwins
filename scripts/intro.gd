extends Control



func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		skip_intro()
	
	if Input.is_action_just_pressed("ui_accept"):
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play()

func skip_intro():
	print("Skip intro")
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.game_scene)

func pause_anim():
	$AnimationPlayer.pause()
