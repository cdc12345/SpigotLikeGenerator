<#include "mcitems.ftl">
<#if input$entity?starts_with("/*@Player*/")>
 ${input$entity}.getInventory().addItem(${mappedMCItemToItemStackCode(input$item, input$amount?replace("/*@int*/","")?number)});
<#else>
if(${input$entity} instanceof Player _player)
	_player.getInventory().addItem(${mappedMCItemToItemStackCode(input$item, input$amount?replace("/*@int*/","")?number)});
</#if>