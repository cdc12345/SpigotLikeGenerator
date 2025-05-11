try {
	if (parameterIndex < args.length) {
		double number = Double.parseDouble(args[parameterIndex++]);
		arguments.put("${field$name}", Math.clamp(number,${field$min},number));
		parameterIndex--;
	}
} catch (Exception ignored) {
}