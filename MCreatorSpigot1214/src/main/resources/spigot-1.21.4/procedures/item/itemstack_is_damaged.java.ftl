<#include "mcitems.ftl">
(${mappedMCItemToItemStackCode(input$item, 1)}.getItemMeta() instanceof org.bukkit.inventory.meta.Damageable damageable)?damageable.getDamage()>0:false)