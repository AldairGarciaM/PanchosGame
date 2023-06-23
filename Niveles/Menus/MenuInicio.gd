extends Node2D

func _on_Button_pressed():
	get_tree().change_scene("res://Niveles/Nivel1.tscn")


func _on_Button2_pressed():
	get_tree().quit()
