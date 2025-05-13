private static ItemStack getPotionItemStack(Material bottleType,PotionType type) {
	ItemStack potion = new ItemStack(bottleType, 1);
	if (potion.hasItemMeta()) {
		PotionMeta meta = (PotionMeta) potion.getItemMeta();
		meta.setBasePotionType(type);
		potion.setItemMeta(meta);
	}
	return potion;
}