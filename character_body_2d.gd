extends CharacterBody2D

var SPEED := 600.0 + int(Global.raccattati / 10)

var touch_active := false
var touch_target_x := 0.0

func _input(event):
	if event is InputEventScreenTouch:
		touch_active = event.pressed
		if event.pressed:
			var viewport_rect := get_viewport().get_visible_rect()
			touch_target_x = clamp(event.position.x, viewport_rect.position.x, viewport_rect.end.x)

	elif event is InputEventScreenDrag:
		var viewport_rect := get_viewport().get_visible_rect()
		touch_target_x = clamp(event.position.x, viewport_rect.position.x, viewport_rect.end.x)

func _physics_process(delta: float) -> void:
	var direction := 0.0

	if touch_active:
		var dx = touch_target_x - global_position.x
		if abs(dx) > 20:
			direction = sign(dx)
	else:
		direction = Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
