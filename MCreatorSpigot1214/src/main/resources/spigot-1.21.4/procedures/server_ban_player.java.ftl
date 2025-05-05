if (${input$player} instanceof Player _player){
	_player.ban(${input$reason}, Duration.of(${input$time}, ChronoUnit.DAYS),${input$source});
}