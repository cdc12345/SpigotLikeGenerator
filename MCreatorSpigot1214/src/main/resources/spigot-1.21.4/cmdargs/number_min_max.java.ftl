try {
	if (parameterIndex < args.length) {
		double number = Double.parseDouble(args[parameterIndex++]);
		arguments.put("${field$name}", Math.clamp(number,${field$min},${field$max}));
		parameterIndex--;
	}
} catch (Exception ignored) {
}