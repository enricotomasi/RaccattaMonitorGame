extends Area2D

var FALL_SPEED = 200.0 + int(Global.raccattati / 10) + (Global.persi * 50)
var rnd = RandomNumberGenerator.new()
var collected := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rnd.randomize()

	var screen_size = get_viewport_rect().size
	var r = rnd.randi_range(1, 5)
	
	var filename = "res://sprites/monitors/0" + str(r) + ".png"
	
	$mon.texture = load(filename)
	position = Vector2(rnd.randi_range(0, screen_size.x), -50)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Se già preso esci
	if collected:
		return
	
	# Fa cadere il monitor
	position.y += FALL_SPEED * delta
	
	# Il monitor non è stato raccattato
	if position.y > get_viewport_rect().size.y - 100:
		collected = true   # BLOCCA I FRAME SUCCESSIVI
		Global.persi += 1
		$AudioMonitorPerso.play()
		await $AudioMonitorPerso.finished
		queue_free()

# San presenzio ha raccattato il monitor
@warning_ignore("unused_parameter")
func _on_body_entered(body: Node2D) -> void:
	if collected:
		return

	collected = true
	$AudioMonitorRaccattato.play()
	Global.raccattati += 1
	
	await $AudioMonitorRaccattato.finished
	queue_free()
