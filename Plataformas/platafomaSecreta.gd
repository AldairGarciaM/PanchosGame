extends TileMap

onready var colision : CollisionShape2D = get_node("Area2D/CollisionShape2D")
onready var tween : Tween = get_node("Tween")

func _ready():
	assert(colision !=null)
	

func _on_Area2D_body_entered(body: KinematicBody2D):
	colision.set_deferred("disable", true)
	tween.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_SINE, Tween.EASE_OUT)
	tween.start()
	


func _on_Tween_tween_completed(object, key):
	queue_free()
