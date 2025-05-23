for (net.minecraft.world.entity.Entity entityiterator1 : ((CraftEntity) ${input$entity}).getHandle().getIndirectPassengers()) {
	Entity entityiterator = entityiterator1.getBukkitEntity();
	${statement$foreach}
}