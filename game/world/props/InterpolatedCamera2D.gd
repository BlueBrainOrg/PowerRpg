extends Camera2D

## Camera will stay at the mid point between these nodes, add a node multiple times for weighing
@export var follow_objects_paths: Array[NodePath]
var follow_objects: Array[Node2D]: set = set_follow_objects 

# Called when the node enters the scene tree for the first time.
func _ready():
	print(follow_objects_paths)
	for path in follow_objects_paths:
		var node = get_node(path)
		if node is Node2D:
			follow_objects.append(node)
	print(follow_objects)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.process_callback == CAMERA2D_PROCESS_IDLE:
		self.update_position()

func _physics_process(delta):
	if self.process_callback == CAMERA2D_PROCESS_PHYSICS:
		self.update_position()

func set_follow_objects(value):
	follow_objects = value
	self.update_position()

func centroid(positions: Array[Node2D]):
	var size = positions.size()
	var x:= 0.0
	var y:= 0.0

	for position in positions:
		x += position.global_position.x
		y += position.global_position.y

	return Vector2(x/size, y/size)

func update_position():
	self.global_position = centroid(self.follow_objects)
