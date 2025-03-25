extends Node

#func _ready() -> void:
	#AudioController.play_music()


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Menu/tutorial.tscn")
