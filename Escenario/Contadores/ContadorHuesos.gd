extends CanvasLayer

onready var Huesos= $Control/Panel/contadorHuesos

var AumentarHuesos = 0

func _ready():
	Huesos.text = String(AumentarHuesos)


func _on_Hueso_sumarHuesos():
	AumentarHuesos = AumentarHuesos +1
	_ready()


func _on_Hueso2_sumarHuesos():
	AumentarHuesos = AumentarHuesos +1
	_ready()


func _on_Hueso3_sumarHuesos():
	AumentarHuesos = AumentarHuesos +1
	_ready()


func _on_Hueso4_sumarHuesos():
	AumentarHuesos = AumentarHuesos +1
	_ready()
