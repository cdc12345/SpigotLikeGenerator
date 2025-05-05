<#include "mcitems.ftl">
if(${input$entity} instanceof Player _player)
	_player.getInventory().addItem(${mappedMCItemToItemStackCode(input$item, input$amount?replace("/*@int*/","")?number)});