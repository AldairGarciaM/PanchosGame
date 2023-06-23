extends Area2D

onready var PortalVerde= $AnimationPlayer

func _ready():
	PortalVerde.play("PortalVerde")
