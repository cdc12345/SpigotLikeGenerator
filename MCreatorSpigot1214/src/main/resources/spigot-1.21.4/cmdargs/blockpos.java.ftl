try {
	if (parameterIndex < args.length) {
		Location location = new Location(world, Double.parseDouble(args[parameterIndex++]),
								Double.parseDouble(args[parameterIndex++]), Double.parseDouble(args[parameterIndex++]));
		arguments.put("${field$name}",location);
		${statement$args}
		parameterIndex -=3;
	}
} catch (Exception ignored){}