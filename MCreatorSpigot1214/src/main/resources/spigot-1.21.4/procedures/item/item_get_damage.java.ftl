<#include "mcitems.ftl">
/*@int*/((${mappedMCItemToItemStackCode(input$item, 1)}.getItemMeta() instanceof Damageable _damageable)?_damageable.getDamage():0)