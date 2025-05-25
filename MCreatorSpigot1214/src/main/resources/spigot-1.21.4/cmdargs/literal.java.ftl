{
	if (parameterIndex < args.length) {
		var literal = args[parameterIndex++];
		if (literal.equals("${field$name}")){
			arguments.put("${field$name}","${field$name}");
			${statement$args}
		}
		parameterIndex--;
	}
}