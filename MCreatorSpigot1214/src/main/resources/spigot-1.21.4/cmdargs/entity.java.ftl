try {
	arguments.compute("${field$name}",(k,v)->{
		String entityName = args[parameterIndex++];
		Entity e;
		e = Bukkit.getPlayer(entityName);
		if (e == null){
			e = Bukkit.getEntity(UUID.fromString(entityName));
		}
		return e;
	});
	${statement$args}
} catch (Exception ignored) {}