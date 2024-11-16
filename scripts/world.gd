extends Node2D

var spawner = load("res://scenes/spawner.tscn")

var score = 0
var dead = false

func _ready() -> void:
	Global.prop_speed = 75
	Global.spawn_time = 3
	%PlayerInverted/PlayerSprite.material = load("res://materials/player_inverted_material.tres")
	%PlayerInverted.position.x = %PlayerNormal.position.x
	%PlayerNormal.apple_eaten.connect(add_score)
	%PlayerInverted.apple_eaten.connect(add_score)
	%PlayerNormal.saw_eaten.connect(end_game);
	%PlayerInverted.saw_eaten.connect(end_game);

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("freeze_up"):
		%PlayerInverted.freeze()
	
	if Input.is_action_just_pressed("freeze_down"):
		%PlayerNormal.freeze()

func _on_player_inverted_unfrozen() -> void:
	if dead: 
		return
	%PlayerInverted.position.x = %PlayerNormal.position.x

func _on_player_normal_unfrozen() -> void:
	if dead:
		return
	%PlayerNormal.position.x = %PlayerInverted.position.x
	

func add_score():
	score += 1
	%LeftLabel.text = str(score)
	%RightLabel.text = str(score)

func _on_enemy_timer_timeout() -> void:
	var rng = RandomNumberGenerator.new()
	var instance = spawner.instantiate()
	instance.position = Vector2(rng.randi_range(-230, 230), 0)
	get_tree().root.add_child(instance)

func end_game():
	dead = true
	$EnemyTimer.stop()
	%GameOver.appear(score)


func _on_difficulty_timer_timeout() -> void:
	$EnemyTimer.wait_time -= 0.1
	Global.prop_speed += 2
	
