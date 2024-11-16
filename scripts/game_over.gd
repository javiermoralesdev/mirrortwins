extends Control

func _ready() -> void:
	$GameOverAnim.play("idle")

func appear(score: int):
	$GameOverAnim.play("show")
	if score > Global.high_score:
		Global.high_score = score
		Global.save()
	%LeftLabel.visible = false
	%RightLabel.visible = false
	$ScoreLabel.text = tr("menu_score") + str(score)
	$HighScoreLabel.text = tr("menu_hscore") + str(Global.high_score)
	$RetryButton.grab_focus()

func retry():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.game_scene)

func main_menu():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.menu_scene)
