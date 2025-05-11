<#include "mcitems.ftl">
<#assign itemstac = mappedMCItemToItemStackCode(input$item)>
(${itemstac}.hasItemMeta() && ${itemstac}.getItemMeta().hasFood())