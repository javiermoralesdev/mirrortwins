extends Area2D

class_name Apple

var direction = 0

func _ready() -> void:
	$AnimationPlayer.play("idle")

func _process(delta: float) -> void:
	position.y += Global.prop_speed * direction * delta


func _on_body_entered(body: Node2D) -> void:
	if body.get_class() == "CharacterBody2D":
		(body as Player).apple()
		queue_free()
