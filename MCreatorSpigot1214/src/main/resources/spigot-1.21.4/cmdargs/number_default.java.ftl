try {
	if (parameterIndex < args.length) {
		arguments.put("${field$name}",Double.parseDouble(args[parameterIndex++]));
		${statement$args}
		parameterIndex--;
	}
} catch (Exception ignored){}