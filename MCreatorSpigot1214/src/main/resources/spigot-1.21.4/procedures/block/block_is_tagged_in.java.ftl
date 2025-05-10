<#include "mcelements.ftl">
<#include "mcitems.ftl">
(Bukkit.getTag("blocks",${toResourceLocation(input$b)},Material.class).isTagged(${mappedBlockToBlockType(input$a)}))