extends Area2D

@export var speed: float = 75

func _ready():
	pass

func _process(delta):
	position += Vector2.RIGHT * speed * delta
