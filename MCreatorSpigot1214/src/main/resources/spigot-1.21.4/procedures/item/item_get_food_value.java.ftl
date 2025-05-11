<#include "mcitems.ftl">
<#assign itemstac = mappedMCItemToItemStackCode(input$item)>
/*@int*/(${itemstac}.getItemMeta().getFood().getNutrition())