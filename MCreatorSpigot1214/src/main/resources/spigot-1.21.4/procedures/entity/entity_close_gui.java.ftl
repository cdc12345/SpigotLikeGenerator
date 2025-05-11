<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.closeInventory();
<#else>
if(${input$entity} instanceof Player _player)
	_player.closeInventory();
</#if>