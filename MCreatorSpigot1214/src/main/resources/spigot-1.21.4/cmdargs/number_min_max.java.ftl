try {
	double number = Double.parseDouble(args[parameterIndex++]);
	arguments.put("${field$name}", Math.clamp(number,${field$min},${field$max}));
} catch (Exception ignored) {
}