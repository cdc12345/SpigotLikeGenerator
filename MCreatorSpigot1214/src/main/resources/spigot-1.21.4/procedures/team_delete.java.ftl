{
	Team _pt = Bukkit.getScoreboardManager().getMainScoreboard().getTeam(${input$name});
	if (_pt != null)
		_pt.unregister();
}