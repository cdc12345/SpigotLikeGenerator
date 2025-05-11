<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.setDisplayName(${input$displayname});
<#else>
if (${input$entity} instanceof Player _player) {
	_player.setDisplayName(${input$displayname});
}
</#if>

