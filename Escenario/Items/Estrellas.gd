extends Area2D

onready var estrella = $AnimatedSprite
onready var sonido = $AudioStreamPlayer2D
signal obtener

func _ready():
	estrella.play("estrella")



func _on_Estrellas_body_entered(body):
	sonido.play()
	set_collision_mask_bit(2, false)
	emit_signal("obtener")
	queue_free()
