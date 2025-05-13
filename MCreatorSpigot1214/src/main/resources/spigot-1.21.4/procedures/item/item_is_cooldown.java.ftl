<#include "mcitems.ftl">
(${input$entity} instanceof Player _plrCldCheck${cbi} && _plrCldCheck${cbi}.getCooldown(${mappedMCItemToItemStackCode(input$item)}) > 0)