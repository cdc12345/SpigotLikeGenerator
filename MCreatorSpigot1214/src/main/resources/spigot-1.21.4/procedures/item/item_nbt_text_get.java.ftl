<#include "mcitems.ftl">
${mappedMCItemToItemStackCode(input$item, 1)}.getItemMeta().getPersistentDataContainer().get(NamespacedKey.fromString(${input$tagName}),PersistentDataType.STRING);