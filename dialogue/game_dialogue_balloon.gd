extends BaseGameDialogueBalloon

@onready var emotes_panel = $Balloon/Panel/Dialogue/HBoxContainer/EmotesPanel

func start(dialogue_resource: DialogueResource, title: String, extra_game_states: Array = []) -> void:
	super.start(dialogue_resource,title,extra_game_states) # we call the base class first. As we are overriding it.
	emotes_panel.play_emote("emote_12_talking")
	

func next(next_id: String) -> void:
	super.next(next_id)
	emotes_panel.play_emote("emote_12_talking")
