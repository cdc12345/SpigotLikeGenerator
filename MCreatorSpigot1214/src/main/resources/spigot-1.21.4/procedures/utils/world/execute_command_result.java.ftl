private static String executeCommandGetResult(World world, Location location, String command) {
	final Block block = world.getBlockAt(location);
	StringBuffer stringBuffer = new StringBuffer();
	BlockCommandSender blockCommandSender = (BlockCommandSender) java.lang.reflect.Proxy.newProxyInstance(
			location.getClass().getClassLoader(), new Class[] { BlockCommandSender.class },
			(proxy, method, args) -> {
				if ("sendMessage".equals(method.getName())) {
					stringBuffer.append(args[args.length - 1]);
				}
				return method.invoke(block, args);
			});
	Bukkit.dispatchCommand(blockCommandSender, command);
	return stringBuffer.toString();
}