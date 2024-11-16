extends Node

signal on_savefile_loaded

var high_score = 0
var prop_speed = 75
var spawn_time = 3.0
var game_scene = load("res://scenes/world.tscn")
var menu_scene = load("res://scenes/menu.tscn")
var intro_scene = load("res://scenes/intro.tscn")
var tutorial_scene = load("res://scenes/tutorial.tscn")
var credits_scene = load("res://scenes/credits.tscn")
var config := ConfigFile.new()
const save_path = "user://data.tres"
const player_section = "player"
const hscore_key = "hscore"
var first_run = true

func _ready() -> void:
	var err = config.load(save_path)
	print(err)
	if err != OK:
		on_savefile_loaded.emit()
		return
	high_score = config.get_value(player_section, hscore_key)
	on_savefile_loaded.emit()

func save():
	config.set_value(player_section, hscore_key, high_score)
	config.save(save_path)
