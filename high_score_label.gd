extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
    text = "Highest Score: "+str(Globals.high_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _check_score():
    if Globals.score > Globals.high_score:
        Globals.high_score = Globals.score
        text = "Highest Score: "+str(Globals.high_score)
    
