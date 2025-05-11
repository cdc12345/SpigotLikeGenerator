{
	if (parameterIndex < args.length) {
		arguments.put("${field$name}",args[parameterIndex++]);
		${statement$args}
		parameterIndex--;
	}
}