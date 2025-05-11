<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.kickPlayer(${input$message});
<#else>
if (${input$player} instanceof Player _player){
	_player.kickPlayer(${input$message});
}
</#if>