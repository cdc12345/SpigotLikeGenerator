<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.setLevel(_player.getLevel() + ${input$xpamount});
<#else>
if(${input$entity} instanceof Player _player)
	_player.setLevel(_player.getLevel() + ${input$xpamount});
</#if>