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
	
	if points == 10:
		print("⚡ Calling Tic-Tac-Toe Mini-Game!")  # Debug print
		start_tic_tac_toe()
func start_tic_tac_toe():
	if tic_tac_toe_scene == null:
		print("Tic-Tac-Toe scene is NOT assigned!")
		return
	
	print("Tic-Tac-Toe scene is assigned, instantiating...")
	var tic_tac_toe_instance = tic_tac_toe_scene.instantiate()
	get_tree().current_scene.add_child(tic_tac_toe_instance)
	tic_tac_toe_instance.visible = true
	print("Adding Tic-Tac-Toe instance to:", get_tree().current_scene)

	

func _on_tic_tac_toe_finished():
	print("🏁 Tic-Tac-Toe finished, removing from scene")
	get_tree().current_scene.get_node("Control").queue_free()  # ✅ Remove the Tic-Tac-Toe game
