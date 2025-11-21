extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pular"):
		get_tree().change_scene_to_file("res://Cenas/main.tscn")
	if Input.is_action_just_pressed("Q"):
		get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/main.tscn")



func _on_quit_pressed() -> void:
	get_tree().quit()
