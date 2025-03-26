extends Control

var num1 = 0
var num2 = 0
var correct_answer = 0
var choices = []
var score = 0
var max_score = 10  # Winning score

@onready var question_label = $QuestionLabel
@onready var score_label = $ScoreLabel
@onready var buttons = [$Answer1, $Answer2, $Answer3]
@onready var restart_button = $RestartButton
@onready var win_label = $WinLabel  # Winning message
@onready var result_label = $ResultLabel  # NEW: Label to show "Try Again!"

func _ready():
	win_label.hide()  # Hide the win message initially
	result_label.hide()  # Hide result message initially
	generate_question()
	restart_button.connect("pressed", Callable(self, "_restart_game"))

func generate_question():
	if score >= max_score:
		win_label.text = "You Win!"
		win_label.show()
		return  # Stop generating questions

	result_label.hide()  # Hide the previous result message

	num1 = randi() % 10 + 1
	num2 = randi() % 10 + 1
	var operation = randi() % 3  # Choose +, -, *

	match operation:
		0:
			question_label.text = str(num1) + " + " + str(num2) + " = ?"
			correct_answer = num1 + num2
		1:
			question_label.text = str(num1) + " - " + str(num2) + " = ?"
			correct_answer = num1 - num2
		2:
			question_label.text = str(num1) + " × " + str(num2) + " = ?"
			correct_answer = num1 * num2

	# Generate answer choices
	choices = [correct_answer]
	while choices.size() < 3:
		var wrong_answer = correct_answer + (randi() % 5 - 2)
		if wrong_answer not in choices:
			choices.append(wrong_answer)

	choices.shuffle()  # Randomize choices

	# 🔴 Disconnect old signals to prevent duplicate connections
	for i in range(3):
		if buttons[i].is_connected("pressed", Callable(self, "_on_answer_selected")):
			buttons[i].disconnect("pressed", Callable(self, "_on_answer_selected"))

		buttons[i].text = str(choices[i])
		buttons[i].connect("pressed", Callable(self, "_on_answer_selected").bind(choices[i]))

func _on_answer_selected(answer):
	if answer == correct_answer:
		score += 1
		score_label.text = "Score: " + str(score)
		generate_question()
	else:
		result_label.text = "Try Again!"
		result_label.show()  # Show the "Try Again!" message

func _restart_game():
	score = 0
	score_label.text = "Score: 0"
	win_label.hide()
	result_label.hide()
	generate_question()

func _on_mathquiz_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Menu/minigame_menu.tscn")
