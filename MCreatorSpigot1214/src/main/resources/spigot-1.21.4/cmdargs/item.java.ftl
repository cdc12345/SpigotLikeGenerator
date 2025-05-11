try {
	if (parameterIndex < args.length) {
		arguments.compute("${field$name}",(k,v)->new ItemStack(Material.matchMaterial(args[parameterIndex++])));
		${statement$args}
		parameterIndex--;
	}
} catch (Exception ignored) {}