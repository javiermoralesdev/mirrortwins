extends CharacterBody2D

class_name Player

@export var inverted = false

signal unfrozen
signal apple_eaten
signal saw_eaten

const SPEED = 200

var frozen := false

func _ready() -> void:
	$PlayerSprite.flip_h = inverted

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		var gravity := get_gravity() if not inverted else -get_gravity()
		velocity += gravity * delta

	if not frozen:
		move(Input.get_axis("left", "right"))
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider():
			if collision.get_collider().name == "Saw":
				print("Hola")
	move_and_slide()

func move(direction: float):
	if get_parent().dead:
		return
	if direction == 1:
		$PlayerSprite.flip_h = inverted
	if direction == -1:
		$PlayerSprite.flip_h = not inverted
	
	if direction == 0:
		$PlayerAnim.play("idle")
	else:
		$PlayerAnim.play("run")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func freeze():
	frozen = true
	velocity = Vector2.ZERO
	$PlayerAnim.play("idle")
	$PlayerTimer.start()
	modulate = Color.DARK_RED


func _on_player_timer_timeout() -> void:
	frozen = false
	modulate = Color.WHITE
	unfrozen.emit()

func apple():
	apple_eaten.emit()
	%CollectPlayer.play()

func saw():
	saw_eaten.emit()
	visible = false
	%SawPlayer.play()
