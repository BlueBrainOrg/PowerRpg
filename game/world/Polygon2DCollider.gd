extends Polygon2D

@onready var collision_polygon_2d = $Box/CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready():
	collision_polygon_2d.polygon = self.polygon
