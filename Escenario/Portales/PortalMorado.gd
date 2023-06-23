extends Area2D

onready var PortalMorado= $AnimationPlayer

func _ready():
	PortalMorado.play("PortalMoradoAnimacion")


func _on_PortalMorado_body_entered(body):
	body._GameOver()
