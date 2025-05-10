try {
	arguments.compute("${field$name}",(k,v)->new ItemStack(Material.matchMaterial(args[parameterIndex++])));
	${statement$args}
} catch (Exception ignored) {}