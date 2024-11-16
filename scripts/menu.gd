extends Control

func _ready() -> void:
	$PlayButton.grab_focus()
	$ScoreText.text = tr("menu_hscore") + str(Global.high_score)
	if Global.first_run:
		Global.first_run = false
		$AnimationPlayer.play("fade_to_normal")

func play():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.tutorial_scene)

func quit():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().quit()
	

func credits():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.credits_scene)
