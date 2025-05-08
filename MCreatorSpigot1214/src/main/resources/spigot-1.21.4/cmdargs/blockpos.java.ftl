try {
	arguments.compute(${field$name},(k, v) -> new Location(world, args[parameterIndex++], args[parameterIndex++], args[parameterIndex++]));
	${statement$args}
} catch (Exception ignored){}