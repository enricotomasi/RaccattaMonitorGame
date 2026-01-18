extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Calcola il punteggio
	var score := 0
	score = (Global.raccattati * 10) - (Global.persi * 50)
	
	# Calcola il livello
	var livello = "CROCIFISSO IN SALA MENSA"
	if score > -2000:
		livello = "LICENZIATO CON DISONORE"
	if score > -1000:
		livello = "LICENZIATO"
	if score > -500:
		livello = "GARZONE"
	if score >= 0:
		livello = "7 LIVELLO"
	if score > 50:
		livello = "6 LIVELLO"
	if score > 100:
		livello = "5 LIVELLO"
	if score > 500:
		livello = "4 LIVELLO"
	if score > 1000:
		livello = "3 LIVELLO"
	if score > 2500:
		livello = "2 LIVELLO"
	if score > 5000:
		livello = "1 LIVELLO"
	if score > 7000:
		livello = "QUADRO"
	if score > 12000:
		livello = "QUADRO INTERMEDIO"
	if score > 15000:
		livello = "MANAGER"
	if score > 25000:
		livello = "CTO"
	if score > 50000:
		livello = "CEO"
		
	$Label.text = "SCORE: "
	$Label.text += str(score)

	$Label.text += "\n"
	$Label.text += livello
