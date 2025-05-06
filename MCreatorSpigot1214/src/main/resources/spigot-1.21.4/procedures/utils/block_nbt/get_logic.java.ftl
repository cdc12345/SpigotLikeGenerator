private static boolean getBlockNBTLogic(World world, Location pos, String tag) {
	var block  = world.getBlockAt(pos);
	if (block.hasMetadata(tag)) {
		var element = block.getMetadata(tag).stream().filter(a->a.getOwningPlugin()==${JavaModName}.INSTANCE).findFirst().get();
		return element.map(MetadataValue::asBoolean).orElse(false);
	} else {
		return false;
	}
}