extends Menu

signal menu_stack_change(length)

export var start_scene: PackedScene

onready var root := get_parent()
onready var pause := $Pause
onready var options := $Options

onready var back_button := $Pause/CenterContainer/VBoxContainer/Back

func _ready():
	clear_menu()
	back_button.visible = start_scene != null


func _handle_event(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		if not is_menu_visible():
			change_menu(pause)
			get_tree().set_input_as_handled()
		elif is_in_sub_menu():
			._handle_event(event)
		else:
			_on_Resume_pressed()


func update_menu():
	.update_menu()
	
	emit_signal("menu_stack_change", menu_stack.size())


func _on_Options_pressed():
	change_menu(options)


func _on_Resume_pressed():
	clear_menu()


func _on_Back_pressed():
	if start_scene:
		get_tree().change_scene_to(start_scene)
