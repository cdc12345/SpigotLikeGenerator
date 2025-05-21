<#include "mcitems.ftl">
<#if enableNMS(w)>
(((org.bukkit.craftbukkit.block.CraftBlockState)${mappedBlockToBlockStateCode(input$block)}).getHandle().getFluidState().isSource())
<#else>
(false/*EnableNMS!!!!*/)
</#if>