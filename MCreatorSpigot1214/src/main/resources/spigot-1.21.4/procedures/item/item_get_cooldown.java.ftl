<#include "mcitems.ftl">
/*@int*/(${input$entity} instanceof Player _plrCldRem${cbi} ? _plrCldRem${cbi}.getCooldown(${mappedMCItemToItemStackCode(input$item)}) * 100 : 0)