<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.ban(${input$reason}, Duration.of(${input$time}, ChronoUnit.${field$timeunit}),${input$source});
<#else>
if (${input$player} instanceof Player _player){
	_player.ban(${input$reason}, Duration.of(${input$time}, ChronoUnit.${field$timeunit}),${input$source});
}
</#if>