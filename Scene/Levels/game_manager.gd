extends Node

@onready var points_label = %PointsLabel
@export var hearts: Array[Node]
@export var tic_tac_toe_scene: PackedScene  # Assign Tic-Tac-Toe scene in Inspector

var points = 0
var lives = 3

func decrease_health():
	lives -= 1
	print(lives)
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
	
	if (lives == 0):
		get_tree().reload_current_scene()
		
func add_point():
	points += 1
	print("Score updated:", points)  # Debug print
	points_label.text = "Score: " + str(points)
