{
	Team _pt = Bukkit.getScoreboardManager().getMainScoreboard().getTeam(${input$name});
	if (_pt != null)
		_pt.setOption(Team.Option.NAME_TAG_VISIBILITY, Team.OptionStatus.${field$visibility.replace("HIDE_","")});
}