<#include "mcitems.ftl">
<#if !input$entity?starts_with("/*@Player*/")>
${input$entity}.setCooldown(${mappedMCItemToItemStackCode(input$item)}, ${opt.toInt(input$ticks)})
<#else>
if(${input$entity} instanceof Player _player) {
	_player.setCooldown(${mappedMCItemToItemStackCode(input$item)}, ${opt.toInt(input$ticks)});
}
</#if>