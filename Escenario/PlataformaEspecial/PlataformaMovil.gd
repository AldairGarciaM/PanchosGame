extends PathFollow2D

onready var animacionPlataforma = $AnimationPlayer

func _ready():
	animacionPlataforma.play("PlataformaMovil")
