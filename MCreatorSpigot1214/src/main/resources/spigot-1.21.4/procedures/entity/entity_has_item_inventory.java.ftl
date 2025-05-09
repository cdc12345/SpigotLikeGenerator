<#include "mcitems.ftl">
(${input$entity} instanceof Player _player${cbi} && _player${cbi}.getInventory().contains(${mappedMCItemToItemStackCode(input$item, 1)}))