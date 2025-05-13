<#include "mcitems.ftl">
/*@int*/((${mappedMCItemToItemStackCode(input$item, 1)}.getItemMeta() instanceof org.bukkit.inventory.meta.Damageable _damageable)?_damageable.getDamage():0)