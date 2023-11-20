extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    
    $CanvasLayer/Control/score.text = "You scored "+str(Globals.score)+" points!"
    Globals.last_score = Globals.score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _on_button_pressed():
    change_scene_to("res://main.tscn")    

func change_scene_to(path):
    get_tree().change_scene_to_file(path)
