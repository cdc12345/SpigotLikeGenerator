<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.performCommand(${input$command});
<#else>
if (${input$entity} instanceof Player _player)
	_player.performCommand(${input$command});
</#if>