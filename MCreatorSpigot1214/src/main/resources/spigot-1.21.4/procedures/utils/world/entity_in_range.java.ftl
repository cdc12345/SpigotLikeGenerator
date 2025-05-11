private static Entity findEntityInWorldRange(World world, Class<? extends Entity> clazz, double x, double y, double z, double range) {
	return world.getNearbyEntities(BoundingBox.of(new Location(world, x, y, z), range, range, range),
					clazz::isInstance).stream()
			.min(Comparator.comparingDouble(e -> e.getLocation().distanceSquared(new Location(world, x, y, z)))).get();
}