extends Area2D

@export var speed: float = 100.0

func _ready():
	pass

func _process(delta):
	position += Vector2.RIGHT * speed * delta
