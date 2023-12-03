extends CharacterBody2D

@export var movement_speed := 300.0
@export var slowdown_distance := 50.0

@onready var point_and_click_2d : PointAndClick2D = $"PointAndClick2D"
@onready var navigation_agent_2d : NavigationAgent2D = $"NavigationAgent2D"

var distance_to_target: float = 0.0

func _ready():
	point_and_click_2d.new_position_marked.connect(move)
	point_and_click_2d.movement_speed = movement_speed
	navigation_agent_2d.target_position = self.global_position

func _physics_process(delta):
	if point_and_click_2d.automatic_movement:
		self.smooth_look_at(navigation_agent_2d.get_next_path_position())
		
		distance_to_target = self.global_position.distance_squared_to(navigation_agent_2d.target_position)
		_calc_speed(delta)
		if distance_to_target <= 1:
			stop()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click_action"):
		point_and_click_2d.set_new_movement_position()

func move(_x):
	point_and_click_2d.automatic_movement = true

func stop():
	point_and_click_2d.automatic_movement = false

func _calc_speed(delta):
	if distance_to_target <= slowdown_distance:
		var desired_speed = navigation_agent_2d.distance_to_target() / delta
		point_and_click_2d.movement_speed = desired_speed
	else:
		point_and_click_2d.movement_speed = self.movement_speed

func smooth_look_at(target: Vector2):
	var angle = (target - self.global_position).angle()
	self.global_rotation = lerp_angle(self.global_rotation, angle, 0.35)
