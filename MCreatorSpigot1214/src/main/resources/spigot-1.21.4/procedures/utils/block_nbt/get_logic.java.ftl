private static boolean getBlockNBTLogic(World world, Location pos, String tag) {
	var block = world.getBlockAt(pos);
	if (block.getState() instanceof TileState tileState){
		return tileState.getPersistentDataContainer().getOrDefault(NamespacedKey.fromString(tag), PersistentDataType.BOOLEAN,false);
	}
	return false;
}