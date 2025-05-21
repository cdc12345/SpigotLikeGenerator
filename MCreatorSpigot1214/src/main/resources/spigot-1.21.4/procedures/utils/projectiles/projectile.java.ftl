private static net.minecraft.world.entity.projectile.Projectile initProjectileProperties(net.minecraft.world.entity.projectile.ThrownPotion entityToSpawn, net.minecraft.world.entity.Entity shooter, net.minecraft.world.phys.Vec3 acceleration) {
	entityToSpawn.setOwner(shooter);
	if (!net.minecraft.world.phys.Vec3.ZERO.equals(acceleration)) {
		entityToSpawn.setDeltaMovement(acceleration);
		entityToSpawn.hasImpulse = true;
	}
	return entityToSpawn;
}