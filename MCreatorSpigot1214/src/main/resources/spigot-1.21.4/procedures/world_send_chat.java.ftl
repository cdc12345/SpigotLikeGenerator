if (world != null) {
	world.getPlayers().forEach(a->a.sendMessage(${input$text}));
}