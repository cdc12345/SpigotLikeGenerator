<#include "mcelements.ftl">
<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.setRespawnLocation(${toBlockPos(input$x,input$y,input$z,"${input$entity}.getWorld()")});
<#else>
if (${input$entity} instanceof Player _player) {
	_player.setRespawnLocation(${toBlockPos(input$x,input$y,input$z,"_player.getWorld()")});
}
</#if>