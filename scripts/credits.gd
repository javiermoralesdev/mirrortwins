extends Control

func go_back():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.menu_scene)
