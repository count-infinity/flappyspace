extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
    text = "Last score: "+str(Globals.last_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
