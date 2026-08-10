extends CanvasLayer

# --- Configurazione ---
@export var max_lives: int = 3       
@export var life_icon: Texture2D = preload("res://sprites/life.png") # SINTASSI CORRETTA
@export var icon_scale_multiplier: float = 1.5 

# --- Riferimenti Interni ---
@onready var lives_container: HBoxContainer = $HUD_Vite/HBox_Icone

func _ready():
	_update_lives_display()

func _process(_delta):
	_update_lives_display()

# Funzione per ridisegnare gli omini
func _update_lives_display():
	if not is_instance_valid(lives_container):
		return

	# Legge il valore attuale da Global
	var current_lives = Global.lives

	if lives_container.get_child_count() == current_lives:
		return
	for child in lives_container.get_children():
		child.queue_free()

	for i in range(current_lives):
		var new_icon = TextureRect.new()
		new_icon.texture = life_icon
		new_icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		new_icon.custom_minimum_size = Vector2(32 * icon_scale_multiplier, 32 * icon_scale_multiplier)
		
		lives_container.add_child(new_icon)
