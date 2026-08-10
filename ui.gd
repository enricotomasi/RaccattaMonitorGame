extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://GameOver.tscn")
		
			
	# Calcola il livello
	var livello = "RACCATTAMONITOR"
	if Global.score >= 0:
		livello = "7 LIVELLO"
	if Global.score > 50:
		livello = "6 LIVELLO"
	if Global.score > 100:
		livello = "5 LIVELLO"
	if Global.score > 500:
		livello = "4 LIVELLO"
	if Global.score > 1000:
		livello = "3 LIVELLO"
	if Global.score > 2500:
		livello = "2 LIVELLO"
	if Global.score > 5000:
		livello = "1 LIVELLO"
	if Global.score > 7000:
		livello = "QUADRO"
	if Global.score > 12000:
		livello = "QUADRO INTERMEDIO"
	if Global.score > 15000:
		Global.livello = "MANAGER"
	if Global.score > 25000:
		Global.livello = "CTO"
	if Global.score > 50000:
		Global.livello = "CEO"
		
	$Label.text = "SCORE: "
	$Label.text += str(Global.score)

	$Label.text += "\n"
	$Label.text += livello
