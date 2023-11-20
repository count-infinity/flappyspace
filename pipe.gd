extends StaticBody2D

@onready var tail = $tail
@onready var collision = $tail_collision


func update_rectangle_length(new_length):
    
    var old_vertices = tail.polygon
    var cverts = collision.polygon
    if old_vertices.size() >= 4:
        # Assuming a simple rectangle, update the x coordinates
        # of the vertices on the right side        
        
        old_vertices[0].y -= new_length  # Top lef vertex
        old_vertices[1].y -= new_length  # Top right vertex
        cverts[0].y = old_vertices[0].y
        cverts[1].y = old_vertices[1].y             
        # Update the Polygon2D's vertices
        tail.polygon = old_vertices
        collision.polygon= cverts
    
    else:
        print("Not enough vertices in the Polygon2D")

# Example usage
func _ready():
    #update_rectangle_length(200)  # Change 200 to your desired length    
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
