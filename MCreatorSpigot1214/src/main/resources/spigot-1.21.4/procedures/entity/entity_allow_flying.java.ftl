<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.setAllowFlight(${input$condition});
<#else>
if(${input$entity} instanceof Player _player)
	_player.setAllowFlight(${input$condition});
</#if>