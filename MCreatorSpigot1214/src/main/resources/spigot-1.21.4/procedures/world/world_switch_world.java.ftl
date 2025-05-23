{
	World _worldorig = world;

	world = Bukkit.getWorld(${generator.map(field$dimension, "dimensions")});

	if (world != null) {
		${statement$worldstatements}
	}

	world = _worldorig;
}