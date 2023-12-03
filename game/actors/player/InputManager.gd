extends Node

@onready var point_and_click_2d : PointAndClick2D = $"../PointAndClick2D"

func _physics_process(delta):
	if Input.is_action_pressed("click_action"):
		point_and_click_2d.set_new_movement_position()
