extends Area2D

onready var sonidoHueso = $AudioStreamPlayer2D
onready var hueso = $AnimatedSprite
signal sumarHuesos

func _ready():
	hueso.play("hueso")


func _on_Hueso_body_entered(body):
	sonidoHueso.play()
	set_collision_mask_bit(2, false)
	emit_signal("sumarHuesos")
	queue_free()
