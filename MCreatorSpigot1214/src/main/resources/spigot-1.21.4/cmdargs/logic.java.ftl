try{
	if (parameterIndex < args.length) {
		arguments.put("${field$name}",Boolean.parseBoolean(args[parameterIndex++]));
		${statement$args}
		parameterIndex--;
	}
} catch (Exception ignored){}