if(${input$entity} instanceof Player _player) {
	Optional.ofNullable(Bukkit.getAdvancement(NamespacedKey.fromString("${generator.map(field$achievement, "achievements")}"))).ifPresent(_adv->{
		AdvancementProgress _ap = _player.getAdvancementProgress(_adv);
		if (!_ap.isDone()) {
			for(String criteria : _ap.getRemainingCriteria())
				_ap.awardCriteria(criteria);
		}
	});
}