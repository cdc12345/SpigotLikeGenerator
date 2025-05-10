<#include "mcelements.ftl">
<#include "mcitems.ftl">
(Bukkit.getTag("items",${toResourceLocation(input$b)} ,Material.class).isTagged(${mappedMCItemToItemStackCode(input$a, 1)}.getType()))