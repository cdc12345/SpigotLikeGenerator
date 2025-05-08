private static String getBlockNBTString(World world, Location pos, String tag) {
	var block = world.getBlockAt(pos);
	if (block.getState() instanceof TileState tileState) {
		return tileState.getPersistentDataContainer()
				.getOrDefault(NamespacedKey.fromString(tag), PersistentDataType.STRING,"");
	}
	return "";
}