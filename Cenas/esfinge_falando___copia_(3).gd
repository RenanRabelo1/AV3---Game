extends CanvasLayer

var cena = 0
var estrondo = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pular"):
		cena += 1
		$AudioStreamPlayer2D.play()
	if cena == 1:
		$Cena1.hide()
	if cena == 2:
		$Cena2.hide()
		$AudioStreamPlayer2D.stop()
	if cena == 3:
		$Cena3.hide()
	if Input.is_action_just_pressed("Pular") && cena >= 3:
		get_tree().change_scene_to_file("res://Cenas/fase_final.tscn")
