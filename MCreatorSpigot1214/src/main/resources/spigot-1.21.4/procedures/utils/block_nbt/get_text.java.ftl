private static String getBlockNBTString(World world, Location pos, String tag) {
	var block  = world.getBlockAt(pos);
    if (block.hasMetadata(tag)) {
		var element = world.getBlockAt(pos).getMetadata(tag).stream().filter(a->a.getOwningPlugin()==${JavaModName}.INSTANCE).findFirst().get();
		return element.map(MetadataValue::asString).orElse("");
    } else {
    	return "";
    }
}