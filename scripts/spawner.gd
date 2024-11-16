extends Sprite2D

var apple: PackedScene = load("res://scenes/apple.tscn")
var saw: PackedScene = load("res://scenes/saw.tscn")

func _on_spawner_timer_timeout() -> void:
	spawn(1)
	spawn(-1)
	queue_free()

func spawn(direction: int) -> void:
	var rng = RandomNumberGenerator.new()
	if(rng.randi_range(0, 1) == 0):
		var instance = apple.instantiate()
		instance.position = position
		instance.direction = direction
		get_tree().root.add_child(instance)
	else:
		var instance = saw.instantiate()
		instance.position = position
		instance.direction = direction
		get_tree().root.add_child(instance)
	
