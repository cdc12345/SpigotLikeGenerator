try {
	double number = Double.parseDouble(args[parameterIndex++]);
	arguments.put("${field$name}", Math.clamp(number,${field$min},number));
} catch (Exception ignored) {
}