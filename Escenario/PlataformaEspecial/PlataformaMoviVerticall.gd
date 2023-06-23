extends Node2D

onready var vertical = $Path2D/PathFollow2D/AnimationPlayer

func _ready():
	vertical.play("PlataformaVertical")
