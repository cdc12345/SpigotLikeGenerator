<#include "mcitems.ftl">
<#if enableNMS(w)>
(((CraftBlock)${mappedBlockToBlock(input$block)}).getHandle() instanceof net.minecraft.world.level.block.BonemealableBlock)
<#else>
(false/*@EnableNMS*/)
</#if>
