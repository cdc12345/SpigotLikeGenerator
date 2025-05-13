<#include "mcitems.ftl">
<#if field$item_type == "">
(false)
<#elseif field$item_type == "Armor">
(${mappedMCItemToItemStackCode(input$item)}.getItemMeta() instanceof ArmorMeta)
<#elseif field$item_type == "Banner">
(${mappedMCItemToItemStackCode(input$item)}.getItemMeta() instanceof BannerMeta)
<#elseif field$item_type == "Potion">
(${mappedMCItemToItemStackCode(input$item)}.getItemMeta() instanceof PotionMeta)
<#elseif field$item_type == "Block">
(${mappedBlockToBlockType(input$item)}.isBlock())
<#elseif field$item_type == "Dye">
(${mappedBlockToBlockType(input$item)}.name().endsWith("DYE"))
<#elseif field$item_type == "Bow" || field$item_type == "Crossbow" || field$item_type == "Trident">
(${mappedBlockToBlockType(input$item)} == Material.${generator.map(field$item_type, "itemtypes")})
<#else>
(Tag.${generator.map(field$item_type, "itemtypes")}.isTagged(${mappedBlockToBlockType(input$item)}))
</#if>