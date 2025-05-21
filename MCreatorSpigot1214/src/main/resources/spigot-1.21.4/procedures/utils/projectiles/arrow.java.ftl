private static net.minecraft.world.entity.projectile.AbstractArrow initArrowProjectile(net.minecraft.world.entity.projectile.AbstractArrow entityToSpawn, net.minecraft.world.entity.Entity shooter, float damage,
		boolean silent, boolean fire, boolean particles, net.minecraft.world.entity.projectile.AbstractArrow.Pickup pickup) {
	entityToSpawn.setOwner(shooter);
	entityToSpawn.setBaseDamage(damage);
	if (silent)
		entityToSpawn.setSilent(true);
	if (fire)
		entityToSpawn.igniteForSeconds(100);
	if (particles)
		entityToSpawn.setCritArrow(true);
	entityToSpawn.pickup = pickup;
	return entityToSpawn;
}