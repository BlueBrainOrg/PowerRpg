@tool
extends RayCast2D

@onready var line_2d = $Line2D

@export_category("Line2D")
@export var width:= 10.0 : set = set_width
@export var width_curve: Curve : set = set_width_curve
@export var default_color: Color = Color.WHITE : set = set_default_color

# Called when the node enters the scene tree for the first time.
func _ready():
	line_2d.points = [Vector2.ZERO, self.target_position]
	line_2d.width = width
	line_2d.width_curve = width_curve
	line_2d.default_color = default_color

func set_width(value):
	width = value
	if line_2d:
		line_2d.width = value

func set_width_curve(value):
	width_curve = value
	if line_2d:
		line_2d.width_curve = value

func set_default_color(value):
	default_color = value
	if line_2d:
		line_2d.default_color = value
