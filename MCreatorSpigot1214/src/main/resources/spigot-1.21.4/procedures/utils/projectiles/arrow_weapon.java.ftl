private static net.minecraft.world.item.ItemStack createArrowWeaponItemStack(net.minecraft.world.level.Level level, int knockback,
		byte piercing) {
	net.minecraft.world.item.ItemStack weapon = new net.minecraft.world.item.ItemStack(
			net.minecraft.world.item.Items.ARROW);
	if (knockback > 0)
		weapon.enchant(
				level.registryAccess().lookupOrThrow(net.minecraft.core.registries.Registries.ENCHANTMENT).getOrThrow(
						net.minecraft.world.item.enchantment.Enchantments.KNOCKBACK),
				knockback);
	if (piercing > 0)
		weapon.enchant(
				level.registryAccess().lookupOrThrow(net.minecraft.core.registries.Registries.ENCHANTMENT).getOrThrow(net.minecraft.world.item.enchantment.Enchantments.PIERCING),
				piercing);
	return weapon;
}