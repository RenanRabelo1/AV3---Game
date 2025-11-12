extends Area2D

@export var speed: float = 50.0

func _ready():
	pass

func _process(delta):
	position += Vector2.RIGHT * speed * delta
