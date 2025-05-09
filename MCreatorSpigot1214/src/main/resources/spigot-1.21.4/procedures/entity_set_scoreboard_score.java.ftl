{
	if (${input$entity} instanceof Player _player) {
		Scoreboard _sc = _player.getScoreboard();
		Objective _so = _sc.getObjective(${input$score});
		if (_so == null)
			_so = _sc.registerNewObjective(${input$score}, Criteria.DUMMY, ${input$score}, RenderType.INTEGER);
		_so.getScore(_player.getName()).setScore(${opt.toInt(input$value)});
	}
}