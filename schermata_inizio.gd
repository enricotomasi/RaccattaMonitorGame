extends Control


const SCENA_GIOCO = "res://game.tscn"

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("Click"):
		Global.lives = Global.max_lives
		Global.score = 0
		get_tree().change_scene_to_file(SCENA_GIOCO)
