extends TextureButton

@export var Catalogue_Scene = "res://Scenes/Menus/catalogue_menu.tscn"


func _on_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Catalogue_Scene)
