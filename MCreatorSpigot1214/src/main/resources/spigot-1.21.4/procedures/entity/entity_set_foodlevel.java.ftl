<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.setFoodLevel(${opt.toInt(input$foodlevel)});
<#else>
if (${input$entity} instanceof Player _player)
	_player.setFoodLevel(${opt.toInt(input$foodlevel)});
</#if>