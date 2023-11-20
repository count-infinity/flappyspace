extends Node

signal player_passed

var pipe_scn = load("res://pipe.tscn")
var pipe_pairs = []

# Called when the node enters the scene tree for the first time.
func _ready():
    randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
    
func generate_obs(xpos):
    var point = randi_range(150, 450)    
    
    var p1 = pipe_scn.instantiate()
    var p2 = pipe_scn.instantiate()
    
    pipe_pairs.append([p1,p2])
    
    
    self.add_child(p1)
    self.add_child(p2)    
    p1.update_rectangle_length(500)
    p1.position.x = xpos
    p1.position.y = point+75
    p1.rotation = PI
    p1.scale.x=3.5    
    p2.update_rectangle_length(500)    
    p2.position.x= xpos
    p2.position.y=point-75
    p2.scale.x=3.5
    
    print("generate obs")
func remove_pair(idx):
    var pair = pipe_pairs[idx]
    pipe_pairs.remove_at(idx)
    for pipe in pair:
        self.remove_child(pipe)
        pipe.queue_free()
        
    player_passed.emit()
    
func reset():
    pipe_pairs=[]
    for child in self.get_children():
        self.remove_child(child)
        child.queue_free()
