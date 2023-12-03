extends Line2D

@onready var navigation_agent_2d = $"../NavigationAgent2D"
@export var body: CharacterBody2D


func _process(delta):
	var map : RID = get_world_2d().navigation_map
	var optimize : bool = true
	var path : PackedVector2Array = NavigationServer2D.map_get_path(map, body.global_position, navigation_agent_2d.target_position, optimize)
	self.points = path
