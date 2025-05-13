<#include "mcitems.ftl">
if (${mappedMCItemToItemStackCode(input$item, 1)}.getItemMeta() instanceof org.bukkit.inventory.meta.Damageable _damageable){
	_damageable.setDamage(${opt.toInt(input$amount)});
}