private static double getBlockNBTNumber(World world, Location pos, String tag) {
	var block  = world.getBlockAt(pos);
	if (block.hasMetadata(tag)) {
		var element = block.getMetadata(tag).stream().filter(a->a.getOwningPlugin()==${JavaModName}.INSTANCE).findFirst();
		return element.map(MetadataValue::asDouble).orElse(0.0);
	} else {
		return 0.0;
	}
}