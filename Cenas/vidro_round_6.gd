extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_area_2d_area_entered(area: Area2D) -> void:
	if area == $carol/Area2D:
		$carol/Label.show()
	if area == $Jose/Area2D:
		$Jose/Label.show()
	
