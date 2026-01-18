extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_monitor_generator_timeout() -> void:
	var mon = load("res://monitor.tscn")
	var inst = mon.instantiate()
	$Monitors.add_child(inst)
	
