<#include "mcelements.ftl">
if (${input$entity} instanceof Player _player) {
	_player.setRespawnLocation(${toBlockPos(input$x,input$y,input$z,"_player.getWorld()")});
}