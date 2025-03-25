extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	


func _on_tutorial2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Menu/tutorial2.tscn")


func _on_mainmenu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Levels/level1.tscn")
