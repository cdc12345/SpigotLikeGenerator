<#if field$dimension??><#--Here for legacy reasons as field$dimension does not exist in older workspaces-->
	if (${input$entity} instanceof Player _player) {
		Location location = _player.getLocation();
		location.setWorld(Bukkit.getWorld("${generator.map(field$dimension, "dimensions")}"));
		_player.teleport(location);
	}
</#if>

