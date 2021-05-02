extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Thank God you're here! (Press E to continue)"
	,"Drones are coming to terrorize my camp tonight."
	,"Our lives depend on your speed and accuracy."
	,"Shoot the targets and then defeat the lead drone before anymore can arrive!"
	,"Be careful not to fall!"
	,"Your mission starts as soon as you press E."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")




func _on_Area_body_entered(_body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()




func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
