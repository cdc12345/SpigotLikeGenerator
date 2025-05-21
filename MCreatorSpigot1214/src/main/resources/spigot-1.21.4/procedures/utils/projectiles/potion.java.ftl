<@addTemplate file="utils/projectiles/projectile.java.ftl"/>
private static net.minecraft.world.entity.projectile.Projectile createPotionProjectile(
			net.minecraft.world.level.Level level, net.minecraft.world.item.ItemStack contents, net.minecraft.world.entity.Entity shooter, net.minecraft.world.phys.Vec3 acceleration) {
		net.minecraft.world.entity.projectile.ThrownPotion entityToSpawn = new net.minecraft.world.entity.projectile.ThrownPotion(
				net.minecraft.world.entity.EntityType.POTION, level);
		entityToSpawn.setItem(contents);
		return initProjectileProperties(entityToSpawn, shooter, acceleration);
}