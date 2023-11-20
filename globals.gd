extends Node

var score = 0
var last_score = 0
var high_score = 0

func _ready():
    load_high_score()

func save():
    
    if score > high_score:        
        var save_game = FileAccess.open("user://high_score.save", FileAccess.WRITE)
        save_game.store_32(score)

func load_high_score():
    var file = FileAccess.open("user://high_score.save", FileAccess.READ)
    if not file: return
        
    var saved_score = file.get_32()    
    high_score = saved_score
