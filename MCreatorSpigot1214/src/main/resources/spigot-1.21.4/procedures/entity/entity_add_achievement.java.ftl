if(${input$entity} instanceof Player _player) {
	Advancement _adv = Bukkit.getAdvancement(NamespacedKey.fromString("${generator.map(field$achievement, "achievements")}"));
	if (_adv != null) {
		AdvancementProgress _ap = _player.getAdvancementProgress(_adv);
		if (!_ap.isDone()) {
			for(String criteria : _ap.getRemainingCriteria())
                _ap.awardCriteria(criteria);
		}
	}
}