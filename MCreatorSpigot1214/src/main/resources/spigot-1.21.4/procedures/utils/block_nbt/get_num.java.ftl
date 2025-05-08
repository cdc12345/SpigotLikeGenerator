private static double getBlockNBTNumber(World world, Location pos, String tag) {
		var block = world.getBlockAt(pos);
		if (block.getState() instanceof TileState tileState){
			return tileState.getPersistentDataContainer().getOrDefault(NamespacedKey.fromString(tag), PersistentDataType.DOUBLE,0.0);
		}
		return 0.0;
}