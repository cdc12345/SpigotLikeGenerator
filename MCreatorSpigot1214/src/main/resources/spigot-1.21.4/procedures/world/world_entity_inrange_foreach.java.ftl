{
	final Location center = new Location(world,${input$x}, ${input$y}, ${input$z});
	for (Entity entityiterator :world.getNearbyEntities(BoundingBox.of(center, ${input$range} / 2d, ${input$range} / 2d, ${input$range} / 2d))){
		${statement$foreach}
	}
}