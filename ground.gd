extends StaticBody2D

var height = 0
var width = 0

@onready var pg2d = $Polygon2D
# Called when the node enters the scene tree for the first time.
func _ready():    
    width = get_polygon_width(pg2d)
    height = get_polygon_height(pg2d)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func get_polygon_width(polygon2D_node):
    var vertices = polygon2D_node.polygon

    if vertices.size() == 0:
        return 0

    var min_x = vertices[0].x
    var max_x = vertices[0].x

    for vertex in vertices:
        min_x = min(min_x, vertex.x)
        max_x = max(max_x, vertex.x)

    var width = max_x - min_x    
    return width
    
func get_polygon_height(polygon2D_node):
    var vertices = polygon2D_node.polygon

    if vertices.size() == 0:
        return 0

    var min_y = vertices[0].y
    var max_y = vertices[0].y

    for vertex in vertices:
        min_y = min(min_y, vertex.y)
        max_y = max(max_y, vertex.y)

    var height = max_y - min_y
    return height
