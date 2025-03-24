extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_tictactoe_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/mini game/control.tscn")


func _on_mathquiz_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/mini game/math.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
