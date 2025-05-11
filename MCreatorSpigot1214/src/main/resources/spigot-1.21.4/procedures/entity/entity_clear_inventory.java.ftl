<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.getInventory().clear();
<#else>
if(${input$entity} instanceof Player _player)
	_player.getInventory().clear();
</#if>