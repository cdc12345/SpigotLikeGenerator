try {
	Location location = new Location(world, Double.parseDouble(args[parameterIndex++]),
    						Double.parseDouble(args[parameterIndex++]), Double.parseDouble(args[parameterIndex++]));
    arguments.put("${field$name}",location);
	${statement$args}
} catch (Exception ignored){}